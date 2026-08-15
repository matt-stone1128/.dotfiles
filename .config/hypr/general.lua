-- ── Look & feel ────────────────────────────────────────────────────────────
local active_border   = { colors = { "rgba(7aa2f7aa)", "rgba(c4a7e7aa)" }, angle = 45 }
local inactive_border = "rgba(414868aa)"

hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 7,
    border_size = 2,
    col = {
      active_border = active_border,
      inactive_border = inactive_border,
    },
    layout = "master",            -- Kiro/ArcoLinux default; "dwindle" also available
    resize_on_border = true,
    extend_border_grab_area = 5,
    allow_tearing = false,
  },

  decoration = {
    rounding = 5,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
    -- Inner glow on the focused window (0.55+) — Kiro blue accent; off when unfocused.
    glow = {
      enabled = true,
      range = 3,
      render_power = 3,
      color = "rgba(7aa2f7cc)",
      color_inactive = "rgba(00000000)",
    },
    -- Dim unfocused windows a little for focus contrast; dim more behind an open scratchpad
    -- so the popped-up window reads clearly on top.
    dim_inactive = true,
    dim_strength = 0.06,
    dim_special = 0.2,
  },

  dwindle = {
    preserve_split = true,
    -- pseudotile removed in 0.55 (was a no-op); use the `pseudo` dispatcher instead.
  },

  master = {
    new_status = "master",
    mfact = 0.5,
  },

  scrolling = {
    fullscreen_on_one_column = true,
  },
  
  input = {
    kb_layout = "us",                            -- US
    kb_options = "grp:alt_shift_toggle,compose:caps",  -- Alt+Shift switches layouts; Caps = Compose
    repeat_rate = 40,
    repeat_delay = 600,
    follow_mouse = 1,
    numlock_by_default = true,
    sensitivity = 0,
    touchpad = {
      natural_scroll = true,
      tap_to_click = true,
      drag_lock = true,
      disable_while_typing = true,
    },
  },

  -- NOTE: the old `gestures { workspace_swipe }` keys were removed in Hyprland 0.51
  -- (replaced by the configurable `gesture` syntax). Swipe was disabled here, so the
  -- block is simply omitted. To enable touchpad workspace-swipe later, use a `gesture`.

  binds = {
    workspace_back_and_forth = true,
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    disable_watchdog_warning = true, -- we launch Hyprland --config directly (no start-hyprland wrapper)
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
    focus_on_activate = true,
    on_focus_under_fullscreen = 1, -- replaces 0.53-removed new_window_takes_over_fullscreen
  },

  cursor = {
    hide_on_key_press = true,
  },
})
