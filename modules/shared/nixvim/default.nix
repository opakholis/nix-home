{ ... }:
{
  imports = [
    ./options
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
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
