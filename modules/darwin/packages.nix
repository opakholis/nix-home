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
  nodejs_22
  (yarn.override { nodejs = nodejs_22; })

  # react-native development
  stable.cocoapods
  stable.ruby
  stable.ios-deploy
  zulu17

  # utilities
  gnupg
  reattach-to-user-namespace
  ytfzf
]
