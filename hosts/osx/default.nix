{ pkgs, ... }: {

  # Explicitly set the username and home directory.
  # https://daiderd.com/nix-darwin/manual/index.html#opt-users.users._name_.home
  users.users.opakholis = {
   name = "opakholis";
   home = "/Users/opakholis";
  };

  # Make sure the nix daemon always runs,
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  
  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

}
