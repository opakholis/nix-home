{ ... }:
{
  imports = [
    ./lazygit.nix
    ./picker.nix
    ./scroll.nix
    ./terminal.nix
  ];

  programs.nixvim = {
    plugins.snacks = {
      enable = true;
    };
  };
}
