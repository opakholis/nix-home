{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    commit-mono
    maple-mono.variable
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
