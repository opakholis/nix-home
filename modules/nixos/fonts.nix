{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    commit-mono
    maple-mono
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
