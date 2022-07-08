local wezterm = require 'wezterm';

wezterm.on("highlight-word", function(window, pane)
    window:perform_action(wezterm.action.SelectTextAtMouseCursor("Word"), pane)
    sel = window:get_selection_text_for_pane(pane)
    cwd = pane:get_current_working_dir()
    wezterm.run_child_process({"timeout", "5", "/home/pjones/.local/bin/drag", "-x", "-T", cwd .. "/" .. sel})
end)

return {
    window_padding = {
        top = 0,
        left = 1,
        right = 0,
        bottom = "0.25cell",
    },

    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 1,
    },

    font = wezterm.font("Iosevka Fixed Medium Extended"),
    font_size = 10.0,
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    color_scheme = "Dracula",
    warn_about_missing_glyphs = false,

    keys = {
        {key="5", mods="CTRL", action={ SplitHorizontal = {domain="CurrentPaneDomain"} }},
        {key="2", mods="CTRL", action={ SplitVertical = {domain="CurrentPaneDomain"} }},
        {key="x", mods="ALT", action={CloseCurrentPane={confirm = false}}},
        {key="c", mods="ALT", action={SpawnTab="DefaultDomain"}},
        {key="7", mods="CTRL", action={CloseCurrentTab = {confirm=false}}},
        {key="n", mods="ALT", action={ActivateTabRelative=1}},
        {key="p", mods="ALT", action={ActivateTabRelative=-1}},
        {key="h", mods="ALT", action={ActivatePaneDirection="Left"}},
        {key="j", mods="ALT", action={ActivatePaneDirection="Down"}},
        {key="k", mods="ALT", action={ActivatePaneDirection="Up"}},
        {key="l", mods="ALT", action={ActivatePaneDirection="Right"}},
        {key="z", mods="ALT", action="TogglePaneZoomState"},
        {key="=", mods="CTRL", action="IncreaseFontSize"},
        {key="-", mods="CTRL", action="DecreaseFontSize"},
        {key="0", mods="CTRL", action="ResetFontSize"},
        {key="H", mods="ALT", action={AdjustPaneSize={"Left", 5}}},
        {key="J", mods="ALT", action={AdjustPaneSize={"Down", 5}}},
        {key="K", mods="ALT", action={AdjustPaneSize={"Up", 5}}},
        {key="L", mods="ALT", action={AdjustPaneSize={"Right", 5}}},
    },
    mouse_bindings = {
        {
            event={Down={streak=2, button="Left"}},
            mods="NONE",
            action=wezterm.action.EmitEvent("highlight-word"),
        }

    }
}
