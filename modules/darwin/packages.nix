{ pkgs }:
# The set of packages to appear in the user environment
# https://nix-community.github.io/home-manager/options.xhtml#opt-home.packages
with pkgs;
let
  shared-packages = import ../shared/packages.nix { inherit pkgs; };
in
shared-packages
++ [
  # common development
  awscli2
  stable-24.scrcpy
  watchman

  # node.js development
  stable-24.nodejs_18
  (yarn.override { nodejs = stable-24.nodejs_18; })

  # react-native development
  stable.ios-deploy
  zulu17

  # utilities
  gnupg
  openssl
  reattach-to-user-namespace
  ytfzf
]
