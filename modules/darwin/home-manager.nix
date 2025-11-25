{
  inputs,
  pkgs,
  config,
  ...
}:
let
  user = "opakholis";
  homeFiles = import ./files.nix { inherit config user; };
in
{
  # Explicitly set the username and home directory.
  # https://daiderd.com/nix-darwin/manual/index.html#opt-users.users._name_.home
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  # Set the primary user for homebrew and other system-wide settings.
  system.primaryUser = user;

  # Enable home-manager
  # https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-nix-darwin-module
  home-manager = {
    useGlobalPkgs = true;
    users.${user} =
      { pkgs, ... }:
      {
        home = {
          packages = pkgs.callPackage ./packages.nix { };

          file = homeFiles;

          shell.enableZshIntegration = true;

          # Extra $PATH which isn't managed by Home Manager.
          # https://nix-community.github.io/home-manager/options.xhtml#opt-home.sessionPath
          sessionPath = [ "$HOME/.local/bin" ];

          # Should check the release notes before changing this value.
          # https://nix-community.github.io/home-manager/options.html#opt-home.stateVersion
          stateVersion = "23.05";
        };

        programs = { } // import ../shared/home-manager.nix { inherit pkgs; };

        imports = [
          inputs.nixvim.homeModules.nixvim
          ../shared/nixvim
        ];
      };
  };
}
