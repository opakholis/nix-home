{pkgs}:
# The set of packages to appear in the user environment
# https://nix-community.github.io/home-manager/options.xhtml#opt-home.packages
with pkgs; let
  shared-packages = import ../shared/packages.nix {inherit pkgs;};
in
  shared-packages
  ++ [
    darwin.ios-deploy
    zulu11
  ]
