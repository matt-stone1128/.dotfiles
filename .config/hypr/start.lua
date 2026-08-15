-- API reference: https://wiki.hypr.land/Configuring/Start/


-- ── Autostart ──────────────────────────────────────────────────────────────
-- exec-once equivalent: run on the hyprland.start event.
local function on_start(cmd) hl.on("hyprland.start", function() hl.exec_cmd(cmd) end) end

on_start("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
on_start("dbus-update-activation-environment --systemd --all")
on_start("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
-- Create the XDG user dirs (Documents, Music, Pictures, …) on first login. This config doesn't
-- process /etc/xdg/autostart, so the xdg-user-dirs autostart never fires on its own. Idempotent.
on_start("xdg-user-dirs-update")
on_start("~/.config/hypr/scripts/import-gsettings.sh")   -- mirror GTK theme/icons/cursor/font into gsettings
-- on_start("swaybg -m fill -i ~/.config/kiro-hyprland/bg/kiro.jpg")
on_start("waypaper --restore")
on_start("env GTK_A11Y=none waybar -c ~/.config/waybar/config-hyprland.jsonc")
on_start("mako")
on_start("hypridle")
-- Live ISO only: auto-launch the installer. archiso-gated; kiro_final strips this line on install.
-- Wrapped in `sh -c` because hl.exec_cmd execs argv directly (no shell) — the `[ ]` test and `&&`
-- need a real shell to be interpreted; a bare string would just try to exec a binary named "[".
-- on_start("sh -c '[ -d /run/archiso/bootmnt ] && calamares_polkit -d -style kvantum'")
on_start("nm-applet --indicator")
-- on_start("variety")            -- wallpaper rotator (configured by kiro-variety-config)
-- on_start("pamac-manager")      -- software manager (pamac-aur)
on_start("blueman-applet")
on_start("emacs --daemon")
