{ ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };
    keymaps = [
      {
        mode = "n";
        key = "<C-a>";
        action = "<esc>ggVG<cr>";
      }
      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<cr>";
      }
      {
        mode = "n";
        key = "<esc><esc>";
        action = "<cmd>nohlsearch<cr>";
        options = {
          silent = true;
        };
      }

      # Window management
      # See `:help wincmd` for a list of all window commands
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
      }

      # Terminal
      {
        mode = "t";
        key = "<esc>";
        action = "<C-\\><C-n>";
      }

      # Quit/Session
      {
        mode = "n";
        key = "<leader>qq";
        action = "<cmd>confirm quitall<cr>";
        options = {
          silent = true;
          desc = "Quit all";
        };
      }
    ];
  };
}
