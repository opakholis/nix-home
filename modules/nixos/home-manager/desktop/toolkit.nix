{ lib, pkgs, ... }:
{
  # https://nix-community.github.io/home-manager/options.xhtml#opt-gtk.enable
  gtk = {
    enable = true;
    font = {
      name = "CommitMono";
      size = 10;
    };
    theme = lib.mkForce {
      name = "catppuccin-mocha-pink-standard+rimless";
      package = pkgs.catppuccin-gtk.override {
        accents = [
          "blue"
          "pink"
        ];
        size = "standard";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
    cursorTheme = {
      name = "catppuccin-mocha-pink-cursors";
      package = pkgs.catppuccin-cursors.mochaPink;
      size = 20;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-qt.enable
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.package = pkgs.catppuccin-qt5ct;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-home.pointerCursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.frappeLavender;
    name = "Catppuccin-Frappe-Lavender-Cursors";
    size = 18;
  };
}
