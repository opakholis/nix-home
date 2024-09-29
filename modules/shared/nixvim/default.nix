{ ... }:
{
  imports = [
    ./options
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withRuby = false;
    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy.enable = true;
      };
    };
  };
}
