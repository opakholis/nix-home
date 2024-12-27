{ outputs, ... }:
{
  imports = [
    ../../modules/darwin/brew.nix
    ../../modules/darwin/fonts.nix
    ../../modules/darwin/home-manager.nix
    ../../modules/darwin/network.nix
  ];

  # Make sure the nix daemon always runs,
  services.nix-daemon.enable = true;

  nix = {
    # https://nixos.wiki/wiki/Storage_optimization
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };

    optimise.automatic = true;

    settings = {
      experimental-features = "nix-command flakes";
    };
  };

  nixpkgs = {
    # List of Nixpkgs overlays.
    overlays = [
      outputs.overlays.stable-packages
    ];
  };

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
    };
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
