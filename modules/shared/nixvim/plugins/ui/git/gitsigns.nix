{ ... }:
{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
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

    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>gl";
        action = "<cmd>lua require 'gitsigns'.blame_line()<cr>";
        options.desc = "Blame Line";
      }
      {
        mode = [ "n" ];
        key = "<leader>gL";
        action = "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>";
        options.desc = "Blame Line (Full)";
      }
      {
        mode = [ "n" ];
        key = "<leader>gj";
        action = "<cmd>lua require 'gitsigns'.nav_hunk('next', {navigation_message = false})<cr>";
        options.desc = "Next Hunk";
      }
      {
        mode = [ "n" ];
        key = "<leader>gk";
        action = "<cmd>lua require 'gitsigns'.nav_hunk('prev', {navigation_message = false})<cr>";
        options.desc = "Prev Hunk";
      }
      {
        mode = [ "n" ];
        key = "<leader>gp";
        action = "<cmd>lua require 'gitsigns'.preview_hunk()<cr>";
        options.desc = "Preview Hunk";
      }
      {
        mode = [ "n" ];
        key = "<leader>gu";
        action = "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>";
        options.desc = "Undo Stage Hunk";
      }
      {
        mode = [ "n" ];
        key = "<leader>gr";
        action = "<cmd>lua require 'gitsigns'.reset_hunk()<cr>";
        options.desc = "Reset Hunk";
      }
      {
        mode = [ "n" ];
        key = "<leader>gR";
        action = "<cmd>lua require 'gitsigns'.reset_buffer()<cr>";
        options.desc = "Reset Buffer";
      }
    ];
  };
}
