{inputs, ...}: let
  inherit (inputs) neovim-nightly-overlay;
in {
  nixpkgs = {
    # https://github.com/nix-community/neovim-nightly-overlay?tab=readme-ov-file#to-use-the-overlay
    overlays = [
      neovim-nightly-overlay.overlays.default
    ];
  };
}
