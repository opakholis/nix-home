{pkgs, ...}: let
  user = "opakholis";
in {
  imports = [
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/hardware.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Manages a such.
  programs = {
    zsh.enable = true;

    # Backlight
    light.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${user}" = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "video"];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable to make sway happy
  security.rtkit.enable = true;

  services.dbus.packages = [pkgs.gcr];

  # Start sway automatically
  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && sway
  '';

  system.stateVersion = "23.11"; # Don't change this!
}
