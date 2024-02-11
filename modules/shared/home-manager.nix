{ pkgs, ... }:
{

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.bat.enable
  bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "catppuccin-frappe";
    };
    themes = let
      cp = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
        rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
        sha256 = "1g2r6j33f4zys853i1c5gnwcdbwb6xv5w6pazfdslxf69904lrg9";
      };
    in {
      catppuccin-latte.src = "${cp}/Catppuccin-latte.tmTheme";
      catppuccin-frappe.src = "${cp}/Catppuccin-frappe.tmTheme";
      catppuccin-macchiato.src = "${cp}/Catppuccin-macchiato.tmTheme";
      catppuccin-mocha.src = "${cp}/Catppuccin-mocha.tmTheme";
    };
  };

}
