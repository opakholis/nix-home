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

      # Better window management
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

      # Better resize panes
      {
        mode = "n";
        key = "<A-Up>";
        action = ":resize -2<cr>";
      }
      {
        mode = "n";
        key = "<A-Down>";
        action = ":resize +2<cr>";
      }
      {
        mode = "n";
        key = "<A-Left>";
        action = ":vertical resize -2<cr>";
      }
      {
        mode = "n";
        key = "<A-Right>";
        action = ":vertical resize +2<cr>";
      }

      # Move current line / block
      {
        mode = "n";
        key = "<A-j>";
        action = ":m .+1<CR>==";
      }
      {
        mode = "n";
        key = "<A-k>";
        action = ":m .-2<CR>==";
      }
      {
        mode = "n";
        key = "<A-j>";
        action = "<esc>:m .+1<cr>==gi";
      }
      {
        mode = "i";
        key = "<A-j>";
        action = "<esc>:m .+1<cr>==gi";
      }
      {
        mode = "i";
        key = "<A-k>";
        action = "<esc>:m .-2<cr>==gi";
      }
      {
        mode = "x";
        key = "<A-j>";
        action = ":m '>+1<CR>gv-gv";
      }
      {
        mode = "x";
        key = "<A-k>";
        action = ":m '<-2<CR>gv-gv";
      }

      # Better paste
      {
        mode = "x";
        key = "p";
        action.__raw = ''[["_dP]]'';
      }

      # Better delete
      {
        mode = "n";
        key = "x";
        action = "\"xx";
      }
      {
        mode = "n";
        key = "dd";
        action = "\"ddd";
      }
      {
        mode = "n";
        key = "D";
        action = "\"dD";
      }

      # Better indenting
      {
        mode = "v";
        key = "<";
        action = "<gv";
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
      }

      # Disable builtin completion
      {
        mode = "i";
        key = "<C-n>";
        action = "<nop>";
      }
      {
        mode = "i";
        key = "<C-p>";
        action = "<nop>";
      }

      # Terminal
      # Better escape
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
