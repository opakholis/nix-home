{pkgs, ...}:
# Shared packages for all users
# https://nix-community.github.io/home-manager/options.xhtml#opt-home.packages
with pkgs; [
  # common development
  scrcpy

  # lsp related
  alejandra

  # network
  dnscrypt-proxy2

  # terminal utilities
  curl
  coreutils
  eza
  jq
  ripgrep
  wget
]
