{
  description = "Just flake. That's it!";

  inputs = {
    # Packages
    nixpkgs.url = "github:NixOS/nixpkgs";

    # Darwin system
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    ## Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager,  ... }: {
    darwinConfigurations."osx" = darwin.lib.darwinSystem {
      modules = [
        # Darwin configuration options
        # https://daiderd.com/nix-darwin/manual/index.html
        ./hosts/osx/default.nix

        # The flake-based setup of the Home Manager nix-darwin module
        # https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-nix-darwin-module
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.opakholis = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
    };
  };
}
