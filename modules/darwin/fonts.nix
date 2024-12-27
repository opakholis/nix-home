{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    hack-font
    maple-mono
    nerd-fonts.symbols-only
  ];
}
