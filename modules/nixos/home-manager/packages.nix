{ pkgs, ... }:
with pkgs;
let
  shared-packages = import ../../shared/packages.nix { inherit pkgs; };
in
shared-packages
++ [
  aria2
  dig
  duf
  gnupg
  pfetch-rs

  # tui
  bottom
  lazydocker

  # wayland stuff
  grim
  mako
  slurp
  swaybg
  wl-clipboard
]
