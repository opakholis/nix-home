{ pkgs, ... }:
# Shared packages for all hosts
# https://nix-community.github.io/home-manager/options.xhtml#opt-home.packages
with pkgs;
[
  # terminal utilities
  curl
  wget

  # modern-unix
  duf
  eza
  fd
  jq
  ripgrep
]
