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
  scrcpy
  watchman

  # node.js development
  stable.nodejs_18
  (yarn.override { nodejs = stable.nodejs_18; })

  # react-native development
  ios-deploy
  zulu17

  # run yt in terminal
  ytfzf

  # security
  stable.bitwarden-cli

]
