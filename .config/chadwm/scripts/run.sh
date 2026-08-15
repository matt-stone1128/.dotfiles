#!/bin/sh
# =============================================================================
# run.sh — chadwm session startup script
#
# This file is executed by your display manager or startx to launch the
# full chadwm desktop session. It starts all background services,
# then enters the window manager loop at the bottom.
#
# To autostart your own apps, add:  run "your-app"
# To stop an autostart entry, comment it out with #
# =============================================================================

# run() — start a program only if it is not already running.
# run.sh runs once per session login; Super+Shift+R only re-execs the chadwm
# binary in the loop at the bottom, not this autostart section. The exact-match
# (-x) pgrep on the 15-char process name avoids false "already up" hits from
# loose substring matching, so no per-app special-casing is needed.
run() {
  if ! pgrep -x "$(basename "$1" | head -c 15)" >/dev/null; then
    "$@" &
  fi
}

# ── Monitor layout ────────────────────────────────────────────────────────────
# Apply a saved arandr/xrandr screen layout named after the current user.
# Generate your layout with arandr, save it to ~/.screenlayout/<username>.sh
# Uncomment the xrandr line below if you are running inside VirtualBox.
#run xrandr --output Virtual-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
# screen layout generated with arandr
[ -f "$HOME/.screenlayout/$(whoami).sh" ] && sh "$HOME/.screenlayout/$(whoami).sh"

# ── System tray applets ───────────────────────────────────────────────────────
run nm-applet                                        # NetworkManager wifi/eth tray
#run pamac-tray                                       # Arch package manager tray (optional)
run variety -n                                       # Wallpaper rotator
run flameshot                                        # Screenshot tool (tray + daemon)
run xfce4-power-manager                              # Battery / display power management
run xfce4-clipman                                    # Clipboard manager
run blueberry-tray                                   # Bluetooth manager tray
run /usr/lib/xfce4/notifyd/xfce4-notifyd             # Desktop notification daemon
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1  # Polkit auth popups (sudo GUI)

# ── Compositor ────────────────────────────────────────────────────────────────
# Provides transparency, shadows and smooth window rendering.
# fastcompmgr is the lightweight default; toggle to/from it at runtime with super+g
# (scripts/fastcompmgr-toggle.sh). Only one compositor should run at a time.
run fastcompmgr -c

# ── Keyboard ──────────────────────────────────────────────────────────────────
run numlockx on                                      # Enable numlock on login
# sxhkd reads keybindings from sxhkdrc and executes them independently of chadwm.
# Edit ~/.config/chadwm/sxhkd/sxhkdrc to add or change keybindings.
sxhkd -c ~/.config/chadwm/sxhkd/sxhkdrc &

# ── Volume control ────────────────────────────────────────────────────────────
run volctl                                           # PipeWire/PulseAudio volume tray

# ── Wallpaper ─────────────────────────────────────────────────────────────────
# Restore the last wallpaper set by feh (saved to ~/.fehbg automatically).
# Falls back to the default chadwm wallpaper if no history exists yet.
if [ -f "$HOME/.fehbg" ]; then
    sh "$HOME/.fehbg" &
else
    feh --bg-fill ~/.config/chadwm/wallpaper/chadwm1.png &
fi

# ── Status bar ────────────────────────────────────────────────────────────────
# chadwm uses its own bar.sh (not slstatus). pkill first so a Super+Shift+R
# restart never stacks a second bar process.
pkill bar.sh
~/.config/chadwm/scripts/bar.sh &

# ── Window manager loop ───────────────────────────────────────────────────────
# Keeps restarting chadwm as long as it exits with code 0 (Super+Shift+R).
# Exits the session when chadwm exits with a non-zero code (Super+Shift+Q).
while type chadwm >/dev/null; do chadwm && continue || break; done
