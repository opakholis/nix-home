{
  description = "Just flake. That's it!";

  inputs = {
    # Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-stable-darwin.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";

    # Darwin system
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Neovim
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      darwin,
      home-manager,
      self,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      user = "opakholis";
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      forEachSystem =
        func:
        nixpkgs.lib.genAttrs systems (
          system:
          func {
            inherit system;
            pkgs = nixpkgs.legacyPackages.${system};
          }
        );
    in
    {
      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              users.${user} = import ./modules/nixos/home-manager;
            };
          }
          ./hosts/nixos
        ];
      };

      darwinConfigurations."osx" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          # The flake-based setup of the Home Manager nix-darwin module
          home-manager.darwinModules.home-manager

          # Darwin configuration options
          ./hosts/osx
        ];
      };

      # Shell environments
      # Used by `nix develop .#<name>`
      devShells = forEachSystem ({ pkgs, ... }: import ./shell.nix { inherit pkgs; });

      # Formatter
      # Used by`nix fmt`
      formatter = forEachSystem ({ pkgs, ... }: pkgs.nixfmt-rfc-style);
    };
}
