{pkgs, ...}: {
  # https://nix-community.github.io/home-manager/options.xhtml#opt-gtk.enable
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Frappe-Compact-Lavender-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["lavender"];
        size = "compact";
        variant = "frappe";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Frappe-Lavender-Cursors";
      package = pkgs.catppuccin-cursors.frappeLavender;
      size = 20;
    };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-qt.enable
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-home.pointerCursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.frappeLavender;
    name = "Catppuccin-Frappe-Lavender-Cursors";
    size = 20;
  };
}
