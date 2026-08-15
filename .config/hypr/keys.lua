local mod = "SUPER"

-- Kiro app defaults — adjust to the shipped Kiro toolset.
local term     = "alacritty"
local files    = "thunar"
local browser  = "firefox"
local editor   = "emacs"
local menu     = "rofi -show drun"
local logout   = "archlinux-logout"   -- Kiro logout dialog (archlinux-logout-gtk4), as on the other editions
local powermenu = "kiro-powermenu"
local lock     = "hyprlock"
local keybindings = "kiro-keybindings"   -- searchable PySide6/QML cheatsheet (auto-detects Hyprland)
local emacs = "emacsclient -c -a 'emacs' "

-- ── Keybinds ───────────────────────────────────────────────────────────────
-- bindd-style: every bind carries a description (shown by the keybindings viewer).
local function bind(keys, desc, dispatcher, opts)
  opts = opts or {}
  if desc then opts.description = desc end
  hl.bind(keys, dispatcher, opts)
end
local function run(cmd) return hl.dsp.exec_cmd(cmd) end

-- Apps & session
bind(mod .. " + Return",         "Terminal",         run(term))
bind(mod .. " + T",              "Terminal",         run(term))
bind(mod .. " + SHIFT + Return", "File manager",     run(files))
bind(mod .. " + E",              "Code editor",      run(editor))
bind(mod .. " + D",              "Launch apps",      run(menu))
bind(mod .. " + Space",          "Launch apps",      run(menu))
bind(mod .. " + SHIFT + D",      "Run launcher",     run("rofi -show run"))
bind(mod .. " + R",              "Theme selector",   run("rofi-theme-selector"))
bind("ALT + R",                  "Theme selector",   run("rofi-theme-selector"))
bind(mod .. " + V",              "Volume control",   run("pavucontrol"))
bind(mod .. " + O",              "Colour picker",    run("hyprpicker -a"))
bind(mod .. " + Q",              "Close window",     hl.dsp.window.close())
bind(mod .. " + SHIFT + Q",      "Close window",     hl.dsp.window.close())
bind(mod .. " + X",              "Logout menu",      run(logout))
bind(mod .. " + SHIFT + X",      "Power menu",       run(powermenu))
bind(mod .. " + Escape",         "Kill mode",        run("hyprctl kill"))
bind(mod .. " + CTRL + S",       "Show keybindings", run(keybindings))
bind("CTRL + ALT + K",           "Logout menu",      run(logout))
bind(mod .. " + SHIFT + R",      "Reload Hyprland",  run("hyprctl reload"))

-- CTRL+ALT app launchers (Kiro scheme)
bind("CTRL + ALT + A",       "Alacritty tweak tool", run("alacritty-tweak-tool"))
bind("CTRL + ALT + B",       "Brave",           run("brave --password-store=basic"))
bind("CTRL + ALT + C",       "Chromium",        run("chromium -no-default-browser-check"))
bind("CTRL + ALT + D",       "OBS Studio",      run("obs"))
bind("CTRL + ALT + E",       "Tweak tool",      run("archlinux-tweak-tool"))
bind("CTRL + ALT + F",       "Firefox",         run("firefox"))
bind("CTRL + ALT + G",       "Chromium",        run("chromium -no-default-browser-check"))
bind("CTRL + ALT + H",       "Tweak tool",      run("hyprland-tweak-tool"))
bind("CTRL + ALT + I",       "Kiro ISO builder", run("kiro-iso-builder"))
bind("CTRL + ALT + L",       "Logout settings", run("archlinux-logout --settings"))
bind("CTRL + ALT + M",       "USB image writer", run("mintstick -m iso"))
bind("CTRL + ALT + O",       "Opera",           run("opera"))
bind("CTRL + ALT + P",       "Package manager", run("pamac-manager"))
bind("CTRL + ALT + Q",       "Alacritty tweak tool", run("alacritty-tweak-tool"))
bind("CTRL + ALT + R",       "Lockscreen wallpaper", run("archlinux-betterlockscreen"))
bind("CTRL + ALT + Return",  "Terminal",        run(term))
bind("CTRL + ALT + T",       "Terminal",        run(term))
bind("CTRL + ALT + S",       "Tweak tool",      run("fish-tweak-tool"))
bind("CTRL + ALT + U",       "Volume control",  run("pavucontrol"))
bind("CTRL + ALT + V",       "Vivaldi",         run("vivaldi-stable"))
bind("CTRL + ALT + W",       "Fastfetch tweak tool", run("fastfetch-tweak-tool"))
bind("CTRL + ALT + Z",       "Fastfetch tweak tool", run("fastfetch-tweak-tool"))
bind("CTRL + ALT + END",     "System monitor",  run("alacritty --class btop -e btop"))
bind("CTRL + SHIFT + Escape","System monitor",  run("alacritty --class btop -e btop"))

-- Function keys (Kiro scheme)
bind(mod .. " + F1",  "Firefox",      run("firefox"))
bind(mod .. " + F2",  "Code editor",  run("code"))
bind(mod .. " + F3",  "Inkscape",     run("inkscape"))
bind(mod .. " + F4",  "GIMP",         run("gimp"))
bind(mod .. " + F5",  "Meld",         run("meld"))
bind(mod .. " + F6",  "VLC",          run("vlc"))
bind(mod .. " + F7",  "VirtualBox",   run("virtualbox"))
bind(mod .. " + F8",  "File manager", run("thunar"))
bind(mod .. " + F9",  "Virt-manager", run("virt-manager"))
bind(mod .. " + F10", "Spotify",      run("spotify"))
bind(mod .. " + F11", "Rofi drun",    run("rofi -show drun"))
bind(mod .. " + F12", "Rofi drun",    run("rofi -show drun"))

-- Window management
bind(mod .. " + SHIFT + Space", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
bind(mod .. " + F",             "Fullscreen",      hl.dsp.window.fullscreen({ mode = "fullscreen" }))
bind(mod .. " + ALT + F",       "Maximize",        hl.dsp.window.fullscreen({ mode = "maximized" }))
bind(mod .. " + P",             "Pseudo-tile",     hl.dsp.window.pseudo())
bind(mod .. " + J",             "Toggle split",    hl.dsp.layout("togglesplit"))
bind(mod .. " + G",             "Toggle group",    hl.dsp.group.toggle())
bind(mod .. " + Escape",        "change layout",   hl.dsp.exec_cmd("hyprctl getoption general:layout | grep -q 'dwindle' && hyprctl keyword general:layout master || hyprctl keyword general:layout dwindle"))

-- Master layout
bind(mod .. " + I",             "Add master",       hl.dsp.layout("addmaster"))
bind(mod .. " + CTRL + Return", "Swap with master", hl.dsp.layout("swapwithmaster"))

-- Groups — pull the focused window into the group in that direction, creating one if needed (0.55+)
bind(mod .. " + CTRL + left",  "Into group left",  hl.dsp.window.move({ into_or_create_group = "l" }))
bind(mod .. " + CTRL + right", "Into group right", hl.dsp.window.move({ into_or_create_group = "r" }))
bind(mod .. " + CTRL + up",    "Into group up",    hl.dsp.window.move({ into_or_create_group = "u" }))
bind(mod .. " + CTRL + down",  "Into group down",  hl.dsp.window.move({ into_or_create_group = "d" }))

-- Focus
bind(mod .. " + left",  "Focus left",  hl.dsp.focus({ direction = "l" }))
bind(mod .. " + right", "Focus right", hl.dsp.focus({ direction = "r" }))
bind(mod .. " + up",    "Focus up",    hl.dsp.focus({ direction = "u" }))
bind(mod .. " + down",  "Focus down",  hl.dsp.focus({ direction = "d" }))

-- Move / swap window
bind(mod .. " + SHIFT + left",  "Swap left",  hl.dsp.window.swap({ direction = "l" }))
bind(mod .. " + SHIFT + right", "Swap right", hl.dsp.window.swap({ direction = "r" }))
bind(mod .. " + SHIFT + up",    "Swap up",    hl.dsp.window.swap({ direction = "u" }))
bind(mod .. " + SHIFT + down",  "Swap down",  hl.dsp.window.swap({ direction = "d" }))

-- Resize
bind(mod .. " + SHIFT + H", "Shrink width",  hl.dsp.window.resize({ x = -50, y = 0,  relative = true }))
bind(mod .. " + SHIFT + L", "Grow width",    hl.dsp.window.resize({ x = 50,  y = 0,  relative = true }))
bind(mod .. " + SHIFT + K", "Shrink height", hl.dsp.window.resize({ x = 0,   y = -50, relative = true }))
bind(mod .. " + SHIFT + J", "Grow height",   hl.dsp.window.resize({ x = 0,   y = 50,  relative = true }))

-- Mouse drag/resize
bind(mod .. " + mouse:272", "Move window",   hl.dsp.window.drag(),   { mouse = true })
bind(mod .. " + mouse:273", "Resize window", hl.dsp.window.resize(), { mouse = true })

-- Workspaces 1..10 — code: keys are layout-independent (qwerty AND azerty in ONE file).
for ws = 1, 10 do
  local key = "code:" .. tostring(ws + 9)            -- code:10 = "1" … code:19 = "0"
  bind(mod .. " + " .. key,         "Workspace " .. ws,         hl.dsp.focus({ workspace = tostring(ws) }))
  bind(mod .. " + CTRL + " .. key,  "Move to workspace " .. ws, hl.dsp.window.move({ workspace = tostring(ws) }))
  bind(mod .. " + SHIFT + " .. key, "Send to workspace " .. ws, hl.dsp.window.move({ workspace = tostring(ws), follow = false }))
end

-- Workspace cycling
bind(mod .. " + period",      "Next workspace",     hl.dsp.focus({ workspace = "e+1" }))
bind(mod .. " + comma",       "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
bind(mod .. " + mouse_down",  "Next workspace",     hl.dsp.focus({ workspace = "e+1" }))
bind(mod .. " + mouse_up",    "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))
bind(mod .. " + TAB",         "Next workspace",     hl.dsp.focus({ workspace = "e+1" }))
bind(mod .. " + SHIFT + TAB", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))

-- Scratchpad (special workspace)
bind(mod .. " + U",         "Toggle scratchpad",  hl.dsp.workspace.toggle_special("scratchpad"))
bind(mod .. " + SHIFT + U", "Send to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- Media & brightness keys
bind("XF86AudioRaiseVolume",  "Volume up",      run("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
bind("XF86AudioLowerVolume",  "Volume down",    run("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
bind("XF86AudioMute",         "Mute",           run("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
bind("XF86AudioPlay",         "Play / pause",   run("playerctl play-pause"))
bind("XF86AudioNext",         "Next track",     run("playerctl next"))
bind("XF86AudioPrev",         "Previous track", run("playerctl previous"))
bind("XF86MonBrightnessUp",   "Brightness up",  run("brightnessctl set 5%+"))
bind("XF86MonBrightnessDown", "Brightness down",run("brightnessctl set 5%-"))

-- Wallpaper (Variety) — ohmychadwm's binding scheme, ported. No recolor combos here:
-- this edition keeps static Tokyo Night colours (no pywal), so there's nothing to recolor.
bind("ALT + N",     "Next wallpaper",     run("variety --next"))
bind("ALT + Right", "Next wallpaper",     run("variety --next"))
bind("ALT + P",     "Previous wallpaper", run("variety --previous"))
bind("ALT + Left",  "Previous wallpaper", run("variety --previous"))
bind("ALT + T",     "Trash wallpaper",    run("variety --trash"))
bind("ALT + F",     "Favorite wallpaper", run("variety --favorite"))
bind("ALT + Up",    "Pause wallpaper",    run("variety --pause"))
bind("ALT + Down",  "Resume wallpaper",   run("variety --resume"))
bind("ALT + W",     "Wallpaper selector", run("variety --selector"))

-- Screenshots
bind("PRINT",           "Screenshot region", run('grim -g "$(slurp)" - | wl-copy'))
bind(mod .. " + PRINT", "Screenshot screen", run("grim - | wl-copy"))
