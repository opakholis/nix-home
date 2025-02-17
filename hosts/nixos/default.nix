{ outputs, pkgs, ... }:
let
  user = "opakholis";
in
{
  imports = [
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/hardware.nix
    ../../modules/nixos/security.nix
    ../../modules/shared/nixvim
    ../../modules/shared/virt
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  # Timezone
  time.timeZone = "Asia/Jakarta";

  # Manages a such.
  programs = {
    zsh.enable = true;
    light.enable = true;
  };

  users.users."${user}" = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs = {
    # List of Nixpkgs overlays.
    overlays = [
      outputs.overlays.stable-packages
    ];
  };

  # Enable to make sway happy
  security.rtkit.enable = true;
  services.dbus.packages = [ pkgs.gcr ];

  environment = {
    # Start sway automatically
    loginShellInit = ''
      [[ "$(tty)" == /dev/tty1 ]] && sway
    '';
  };

  system.stateVersion = "23.05"; # Don't change this!
}
