{ ... }:
{
  programs.nixvim.plugins = {
    illuminate = {
      enable = true;
      settings = {
        delay = 150;
        large_file_cutoff = 1500;
        filetypes_denylist = [
          "alpha"
          "NvimTree"
          "Trouble"
          "toggleterm"
          "TelescopePrompt"
        ];
      };
    };
  };
}
