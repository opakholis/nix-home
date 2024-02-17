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
    darwin,
    home-manager,
    ...
  } @ inputs: {
    darwinConfigurations."osx" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = {inherit inputs;};
      modules = [
        # The flake-based setup of the Home Manager nix-darwin module
        home-manager.darwinModules.home-manager

        # Darwin configuration options
        ./hosts/osx
      ];
    };
  };
}
