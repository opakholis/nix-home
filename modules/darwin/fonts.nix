{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    commit-mono
    maple-mono
    nerd-fonts.symbols-only
  ];
}
