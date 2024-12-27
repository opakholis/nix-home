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
      font-family = "Symbols Nerd Font Mono"
      font-family = "Hack"
      font-family-bold = "Hack"
      font-family-italic = "Maple Mono"
      font-family-bold-italic = "Maple Mono"
      font-thicken = true
      adjust-cell-width = -1
      adjust-cell-height = 1
      adjust-underline-position = 1
      adjust-underline-thickness = -1

      # Theme
      theme = "catppuccin-frappe"
      cursor-invert-fg-bg = true
      mouse-hide-while-typing = true

      # Window
      window-width = 100
      window-height = 25
      window-padding-x = 12
      window-padding-balance = true
      macos-titlebar-proxy-icon = "hidden"
      macos-option-as-alt = true

      # keybindings
      keybind = super+shift+i=inspector:toggle
      keybind = super+shift+r=reload_config

      # Other
      copy-on-select = clipboard
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
