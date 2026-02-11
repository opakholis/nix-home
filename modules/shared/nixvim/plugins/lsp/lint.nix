{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      eslint_d
    ];

    plugins.lint = {
      enable = true;
      lintersByFt = {
        nix = [ "nix" ];
      };
    };
  };
}
