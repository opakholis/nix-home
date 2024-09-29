{ ... }:
{
  imports = [
    ../../modules/darwin/brew.nix
    ../../modules/darwin/home-manager.nix
    ../../modules/darwin/network.nix
    ../../modules/shared
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
      options = "--delete-older-than 30d";
    };

    # `experimental-features` | enable nix flakes
    # `auto-optimise-store` | optimise nix store every build
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
