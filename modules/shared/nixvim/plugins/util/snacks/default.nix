{ ... }:
{
  imports = [
    ./lazygit.nix
    ./terminal.nix
  ];

  programs.nixvim = {
    plugins.snacks = {
      enable = true;
    };
  };
}
