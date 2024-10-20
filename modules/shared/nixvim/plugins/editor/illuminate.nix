{ ... }:
{
  programs.nixvim.plugins = {
    illuminate = {
      enable = true;
      delay = 150;
      largeFileCutoff = 1500;
      filetypesDenylist = [
        "alpha"
        "NvimTree"
        "Trouble"
        "toggleterm"
        "TelescopePrompt"
      ];
    };
  };
}
