{pkgs, ...}: let
  user = "opakholis";
in {
  virtualisation.docker = {
    enable = true;
    autoPrune = {
      enable = true;
      flags = ["--all"];
      dates = "weekly";
    };
  };

  users.users.${user}.extraGroups = ["docker"];
}
