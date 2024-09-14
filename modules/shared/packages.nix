{ pkgs, ... }:
# Shared packages for all users
# https://nix-community.github.io/home-manager/options.xhtml#opt-home.packages
with pkgs;
[
  # lsp related
  alejandra

  # terminal utilities
  curl
  eza
  jq
  ripgrep
  wget
]
