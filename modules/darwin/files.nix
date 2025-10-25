{ user, config }:

let
  xdg_config = "${config.users.users.${user}.home}/.config";
in
{
  "${xdg_config}/ghostty/config" = {
    text = ''
      # See default config:
      # ghostty +show-config --default --docs

      # Fonts
      font-family = "CommitMono Regular"
      font-family-bold = "CommitMono Bold"
      font-family-italic = "Maple Mono"
      font-family-bold-italic = "Maple Mono"
      font-size = 14
      font-thicken = true
      font-feature = -calt
      adjust-cell-width = -1
      adjust-underline-position = 1

      # Theme
      theme = "Catppuccin Frappe"
      title = ":: ghost in the shell ::"
      cursor-invert-fg-bg = true
      mouse-hide-while-typing = true
      bell-features = "no-title"

      # Window
      window-padding-x = 6
      window-padding-y = 0,2
      window-padding-balance = true
      macos-titlebar-style = "tabs"
      macos-option-as-alt = true

      # keybindings
      keybind = super+s=ignore
      keybind = alt+left=unbind
      keybind = alt+right=unbind
      keybind = super+shift+i=inspector:toggle
      keybind = super+shift+r=reload_config
    '';
  };
  "${xdg_config}/ytfzf/conf.sh" = {
    text = ''
      show_thumbnails=0
      thumbnail_quality=medium
      fzf_preview_side=up
    '';
  };
}
