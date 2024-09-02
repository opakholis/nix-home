{pkgs, ...}: let
  user = "opakholis";
in {
  virtualisation = {
    docker = {
      enable = true;
    };
  };

  users.users.${user}.extraGroups = ["docker"];
}
