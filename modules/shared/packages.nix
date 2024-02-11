{ pkgs, ...}:

# The set of packages to appear in the user environment
# https://nix-community.github.io/home-manager/options.html#opt-home.packages
with pkgs; [
  # common development
  bat
  fzf
  lazygit
  scrcpy
  tmux

  # encryption and security
  bitwarden-cli

  # terminal utilities
  curl
  coreutils
  eza
  jq
  ripgrep
  wget
  zoxide
]
