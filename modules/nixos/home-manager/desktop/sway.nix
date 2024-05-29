{pkgs, ...}: {
  # https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.sway.enable
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";

      bars = [];

      colors = {
        background = "#1e1e2e";
        focused = {
          background = "#1e1e2e";
          border = "#b4befe";
          childBorder = "#b4befe";
          indicator = "#f5e0dc";
          text = "#cdd6f4";
        };
        focusedInactive = {
          background = "#1e1e2e";
          border = "#6c7086";
          childBorder = "#6c7086";
          indicator = "#f5e0dc";
          text = "#cdd6f4";
        };
        unfocused = {
          background = "#1e1e2e";
          border = "#f5e0dc";
          childBorder = "#f5e0dc";
          indicator = "#f5e0dc";
          text = "#cdd6f4";
        };
        urgent = {
          background = "#1e1e2e";
          border = "#fab387";
          childBorder = "#fab387";
          indicator = "#6c7086";
          text = "#fab387";
        };
        placeholder = {
          background = "#1e1e2e";
          border = "#6c7086";
          childBorder = "#6c7086";
          indicator = "#6c7086";
          text = "#cdd6f4";
        };
      };

      output = {
        "*" = {
          bg = "${pkgs.sway}/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png fill";
        };
      };

      gaps = {
        inner = 10;
      };

      window = {
        border = 1;
        titlebar = false;
      };
    };
    extraConfig = ''
      # Brightness
      bindsym XF86MonBrightnessDown exec light -U 5
      bindsym XF86MonBrightnessUp exec light -A 5

      # Volume
      bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'
      bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'
      bindsym XF86AudioMute exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'
    '';
  };
}
