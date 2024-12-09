{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.grug-far-nvim
    ];
    extraConfigLua = ''
      require('grug-far').setup({
        engine = 'ripgrep' -- or 'astgrep'
      });
    '';

    keymaps = [
      {
        mode = "n";
        key = "<leader>sr";
        action = "<cmd>GrugFar<cr>";
        options = {
          desc = "Find and Replace";
        };
      }
    ];
  };
}
