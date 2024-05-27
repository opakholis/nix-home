{
  pkgs,
  lib,
  ...
}: let
  user = "opakholis";

  shared-programs = import ../shared/home-manager.nix {inherit pkgs;};
in {
  # https://nix-community.github.io/home-manager/options.xhtml#opt-fonts.fontconfig.enable
  fonts.fontconfig.enable = true;

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

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    packages = pkgs.callPackage ./packages.nix {};
    stateVersion = "23.11";
  };

  programs =
    shared-programs
    // {
      gpg.enable = true;

      # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.alacritty.enable
      alacritty = {
        enable = true;
        settings = {
          cursor = {
            style = "Block";
          };

          window = {
            opacity = 1.0;
            padding = {
              x = 18;
              y = 18;
            };
          };

          font = {
            normal = {
              family = "GeistMono Nerd Font";
              style = "Regular";
            };
            size = lib.mkMerge [
              (lib.mkIf pkgs.stdenv.hostPlatform.isLinux 11.5)
              (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin 14)
            ];
          };

          colors = {
            primary = {
              background = "#303446";
              foreground = "#c6d0f5";
              dim_foreground = "#838ba7";
              bright_foreground = "#c6d0f5";
            };

            cursor = {
              text = "#303446";
              cursor = "#f2d5cf";
            };

            vi_mode_cursor = {
              text = "#303446";
              cursor = "#babbf1";
            };

            selection = {
              text = "#303446";
              background = "#f2d5cf";
            };

            normal = {
              black = "#51576d";
              red = "#e78284";
              green = "#a6d189";
              yellow = "#e5c890";
              blue = "#8caaee";
              magenta = "#f4b8e4";
              cyan = "#81c8be";
              white = "#b5bfe2";
            };

            bright = {
              black = "#626880";
              red = "#e78284";
              green = "#a6d189";
              yellow = "#e5c890";
              blue = "#8caaee";
              magenta = "#f4b8e4";
              cyan = "#81c8be";
              white = "#a5adce";
            };

            dim = {
              black = "#51576d";
              red = "#e78284";
              green = "#a6d189";
              yellow = "#e5c890";
              blue = "#8caaee";
              magenta = "#f4b8e4";
              cyan = "#81c8be";
              white = "#b5bfe2";
            };
          };
        };
      };
    };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-services.gnome-keyring.enable
  services.gnome-keyring.enable = true;

  # https://nix-community.github.io/home-manager/options.xhtml#opt-services.gpg-agent.enable
  services.gpg-agent.enable = true;
  services.gpg-agent.pinentryPackage = pkgs.pinentry-gnome3;
}
