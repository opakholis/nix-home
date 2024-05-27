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

    ## Neovim
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    nixpkgs,
    darwin,
    home-manager,
    ...
  } @ inputs: let
    user = "opakholis";
    supportedSystems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    forEachSupportedSystem = f:
      nixpkgs.lib.genAttrs supportedSystems (
        system:
          f {
            pkgs = import inputs.nixpkgs {
              inherit system;
            };
          }
      );
  in {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            users.${user} = import ./modules/nixos/home-manager.nix;
          };
        }
        ./hosts/nixos
      ];
    };

    darwinConfigurations."osx" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        # The flake-based setup of the Home Manager nix-darwin module
        home-manager.darwinModules.home-manager

        # Darwin configuration options
        ./hosts/osx
      ];
    };

    # Shell environments
    devShells = forEachSupportedSystem (
      {pkgs}:
        import ./dev-shells.nix {
          inherit pkgs;
        }
    );
  };
}
