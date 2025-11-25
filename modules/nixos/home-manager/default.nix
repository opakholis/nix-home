{ pkgs, ... }:
let
  user = "opakholis";
in
{
  imports = [
    ./desktop
    ./programs.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    packages = pkgs.callPackage ./packages.nix { };
    stateVersion = "23.05";
    shell.enableZshIntegration = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-services.gnome-keyring.enable
  services.gnome-keyring.enable = true;

  # https://nix-community.github.io/home-manager/options.xhtml#opt-services.gpg-agent.enable
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };
}
