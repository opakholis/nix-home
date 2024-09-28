{ ... }:
{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      autoClose = true;
      diagnostics = {
        enable = true;
      };
      filters = {
        custom = [
          "node_modules"
          ".git"
          ".cache"
        ];
      };
      renderer = {
        indentMarkers = {
          enable = true;
        };
      };
      updateFocusedFile = {
        enable = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<cr>";
        options = {
          desc = "Explorer";
          silent = true;
        };
      }
    ];
  };
}
