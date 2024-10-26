{ pkgs, ... }:
# Shared packages for all hosts
# https://nix-community.github.io/home-manager/options.xhtml#opt-home.packages
with pkgs;
[
  # terminal utilities
  curl
  eza
  jq
  ripgrep
  wget
]
