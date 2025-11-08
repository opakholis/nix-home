{ inputs, ... }:
{
  stable-packages =
    final: _prev:
    let
      isDarwin = builtins.match ".*-darwin" final.system != null;
      pickInput = name: builtins.getAttr (if isDarwin then name + "-darwin" else name) inputs;
      mkStable = name: import (pickInput name) { inherit (final) system; };
    in
    # https://nixos.wiki/wiki/Overlays
    # Provide stable packages under 'pkgs.stable'
    {
      stable = mkStable "nixpkgs-stable";
      stable-24 = mkStable "nixpkgs-2411";
    };
}
