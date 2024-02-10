{ pkgs, ... }: {

# Set explicit username and home directory for the user.
# https://daiderd.com/nix-darwin/manual/index.html#opt-users.users._name_.home
users.users.opakholis = {
  name = "opakholis";
  home = "/Users/opakholis";
};

# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
environment.systemPackages =
  [ pkgs.bat
  ];

# Auto upgrade nix package and the daemon service.
services.nix-daemon.enable = true;

# Necessary for using flakes on this system.
nix.settings.experimental-features = "nix-command flakes";

# Create /etc/zshrc that loads the nix-darwin environment.
programs.zsh.enable = true;  # default shell on catalina
# programs.fish.enable = true;

# Used for backwards compatibility, please read the changelog before changing.
# $ darwin-rebuild changelog
system.stateVersion = 4;

# The platform the configuration will be used on.
nixpkgs.hostPlatform = "aarch64-darwin";
}
