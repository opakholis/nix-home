{pkgs, ...}:
with pkgs; let
  shared-packages = import ../shared/packages.nix {inherit pkgs;};
in
  shared-packages
  ++ [
    dig
    pfetch-rs

    # wayland stuff
    grim
    mako
    slurp
    swaybg
    wl-clipboard

    vimb
  ]
