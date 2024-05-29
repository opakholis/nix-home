{
  pkgs,
  lib,
  ...
}: let
  user = "opakholis";
  shared-programs = import ../../shared/home-manager.nix {inherit pkgs;};
in {
  imports = [
    ./desktop
  ];

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

  # https://nix-community.github.io/home-manager/options.xhtml#opt-fonts.fontconfig.enable
  fonts.fontconfig.enable = true;

  # https://nix-community.github.io/home-manager/options.xhtml#opt-services.gnome-keyring.enable
  services.gnome-keyring.enable = true;

  # https://nix-community.github.io/home-manager/options.xhtml#opt-services.gpg-agent.enable
  services.gpg-agent.enable = true;
  services.gpg-agent.pinentryPackage = pkgs.pinentry-gnome3;
}
