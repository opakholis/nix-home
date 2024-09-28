{ ... }:
{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          always_show_bufferline = false;
          diagnostics = "nvim_lsp";
          mode = "buffers";

          close_icon = " ";
          buffer_close_icon = "󰱝 ";
          modified_icon = "󰔯 ";
          offsets = [
            {
              filetype = "NvimTree";
              text = "Explorer";
              highlight = "PanelHeading";
              padding = 1;
            }
          ];
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<cr>";
        options = {
          desc = "Delete buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>BufferLineCloseOthers<cr>";
        options = {
          desc = "Delete other buffers";
        };
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
      }
      {
        mode = "n";
        key = "<S-tab>";
        action = "<c-6>"; # switch to last buffer
      }
    ];
  };
}
