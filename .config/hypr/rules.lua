-- Window rules:  https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- ── Window rules (0.53+ unified hl.window_rule) ────────────────────────────
-- ArcoLinux windowrulev2 lines migrated to the table form.
hl.window_rule({ match = { class = "^(Spotify)$" }, tile = true })
-- Waybar "yay update" popup terminal:
hl.window_rule({ match = { class = "^(update)$", title = "^(update)$" }, float = true })
hl.window_rule({ match = { class = "^(update)$", title = "^(update)$" }, size = { "60%", "50%" } })
hl.window_rule({ match = { class = "^(update)$", title = "^(update)$" }, center = true })
-- Firefox picture-in-picture (kept handy, commented):
-- hl.window_rule({ match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" }, float = true })
-- Smooth touchpad scrolling in terminals (from nemesis input config):
hl.window_rule({ match = { class = "(Alacritty|kitty)" }, scroll_touchpad = 1.5 })
-- Transparent terminal — compositor opacity (works in VBox/QEMU/bare-metal alike; Hyprland's
-- blur frosts it). active/inactive: 0.90/0.85.
hl.window_rule({ match = { class = "Alacritty" }, opacity = "0.90 0.85" })
-- Lock the pointer inside an app — handy for games / remote desktop (0.55+):
-- hl.window_rule({ match = { class = "^(steam_app_.*)$" }, confine_pointer = true })

-- ── Layer rules (blur the shell layers, not just windows) ──────────────────
-- Waybar/rofi/mako sit above the compositor's blur pass by default, so without an explicit
-- layer_rule they render flat against a blurred desktop. ignore_alpha lets the blur show through
-- each surface's own semi-transparent background instead of blurring it as a solid rect.
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "waybar" }, ignore_alpha = 0.6 })
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })
hl.layer_rule({ match = { namespace = "rofi" }, ignore_alpha = 0.6 })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
hl.layer_rule({ match = { namespace = "notifications" }, ignore_alpha = 0.6 })
hl.window_rule({ match = { class = "galculator" }, float = true })

hl.window_rule({ match = { class = "galculator" }, max_size = {600, 400} })
