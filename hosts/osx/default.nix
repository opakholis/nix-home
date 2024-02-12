{...}: {
  imports = [
    ../../modules/darwin/home-manager.nix
  ];

  # Make sure the nix daemon always runs,
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
