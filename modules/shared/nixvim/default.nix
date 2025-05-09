{ ... }:
{
  imports = [
    ./options
    ./plugins
    ./themes
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withRuby = false;
    withPython3 = false;
    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy.enable = true;
      };
    };
  };
}
