{ inputs, ... }:
let
  isDarwin = system: (builtins.match ".*darwin" system) != null;
in
{
  # https://nixos.wiki/wiki/Overlays
  # Provide stable packages under 'pkgs.stable'
  stable-packages = final: _prev: {
    stable = import (
      if (isDarwin final.system) then inputs.nixpkgs-stable-darwin else inputs.nixpkgs-stable
    ) { inherit (final) system; };
  };
}
