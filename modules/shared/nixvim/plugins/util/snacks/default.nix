{ ... }:
{
  imports = [
    ./lazygit.nix
    ./scroll.nix
    ./terminal.nix
  ];

  programs.nixvim = {
    plugins.snacks = {
      enable = true;
    };
  };
}
