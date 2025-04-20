{ ... }:
{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      lazyLoad.settings = {
        event = "DeferredUIEnter";
      };
      settings = {
        current_line_blame = true;
        signs = {
          add.text = "▎";
          change.text = "▎";
          delete.text = "󰐊";
          topdelete.text = "󰐊";
          changedelete.text = "󰐊";
        };
      };
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>g";
        group = "Git";
        icon = " ";
      }
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>gl";
        action = "<cmd>lua require 'gitsigns'.blame_line()<cr>";
        options.desc = "Blame line";
      }
      {
        mode = "n";
        key = "<leader>gL";
        action = "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>";
        options.desc = "Blame line full";
      }
      {
        mode = "n";
        key = "<leader>gj";
        action = "<cmd>lua require 'gitsigns'.nav_hunk('next', {navigation_message = false})<cr>";
        options.desc = "Next hunk";
      }
      {
        mode = "n";
        key = "<leader>gk";
        action = "<cmd>lua require 'gitsigns'.nav_hunk('prev', {navigation_message = false})<cr>";
        options.desc = "Prev hunk";
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = "<cmd>lua require 'gitsigns'.preview_hunk()<cr>";
        options.desc = "Preview hunk";
      }
      {
        mode = "n";
        key = "<leader>gu";
        action = "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>";
        options.desc = "Undo stage hunk";
      }
      {
        mode = "n";
        key = "<leader>gr";
        action = "<cmd>lua require 'gitsigns'.reset_hunk()<cr>";
        options.desc = "Reset hunk";
      }
      {
        mode = "n";
        key = "<leader>gR";
        action = "<cmd>lua require 'gitsigns'.reset_buffer()<cr>";
        options.desc = "Reset buffer";
      }
    ];
  };
}
