{pkgs, ...}:
# Shared packages for all users
# https://nix-community.github.io/home-manager/options.xhtml#opt-home.packages
with pkgs; [
  # common development
  scrcpy
  watchman

  # node.js development
  nodejs_18
  nodePackages.yarn

  # lsp related
  alejandra

  # encryption and security
  bitwarden-cli

  # terminal utilities
  curl
  coreutils
  eza
  jq
  ripgrep
  wget
]
