{
  description = "Just flake. That's it!";

  inputs = {
    # Packages
    nixpkgs.url = "github:NixOS/nixpkgs";

    # Darwin system
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin,  ... }: {
    darwinConfigurations."osx" = darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
      ];
    };
  };
}
