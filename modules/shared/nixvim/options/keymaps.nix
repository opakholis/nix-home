{ ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      {
        key = "<C-a>";
        action = "<esc>ggVG<cr>";
      }
      {
        key = "<C-s>";
        action = "<cmd>w<cr>";
      }
      {
        key = "<esc><esc>";
        action = "<cmd>nohlsearch<cr>";
        options.silent = true;
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
        options.silent = true;
      }
      {
        mode = "n";
        key = "<A-Down>";
        action = ":resize +2<cr>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<A-Left>";
        action = ":vertical resize -2<cr>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<A-Right>";
        action = ":vertical resize +2<cr>";
        options.silent = true;
      }

      # Move current line / block
      {
        key = "<A-j>";
        action = ":m .+1<CR>==";
        options.silent = true;
      }
      {
        key = "<A-k>";
        action = ":m .-2<CR>==";
        options.silent = true;
      }
      {
        mode = "i";
        key = "<A-j>";
        action = "<esc>:m .+1<cr>==gi";
        options.silent = true;
      }
      {
        mode = "i";
        key = "<A-k>";
        action = "<esc>:m .-2<cr>==gi";
        options.silent = true;
      }
      {
        mode = "x";
        key = "<A-j>";
        action = ":m '>+1<CR>gv-gv";
        options.silent = true;
      }
      {
        mode = "x";
        key = "<A-k>";
        action = ":m '<-2<CR>gv-gv";
        options.silent = true;
      }

      # Better paste
      {
        mode = "x";
        key = "p";
        action.__raw = ''[["_dP]]'';
        options.silent = true;
      }

      # Better delete
      {
        mode = "n";
        key = "x";
        action = "\"xx";
        options.silent = true;
      }
      {
        mode = "n";
        key = "dd";
        action = "\"ddd";
        options.silent = true;
      }
      {
        mode = "n";
        key = "D";
        action = "\"dD";
        options.silent = true;
      }

      # Better indenting
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options.silent = true;
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options.silent = true;
      }

      # Terminal
      # Better escape
      {
        mode = "t";
        key = "<C-c>";
        action = "<C-\\><C-n>";
        options.silent = true;
      }
      {
        mode = "t";
        key = "<C-h>";
        action = "<C-\\><C-n><C-w>h";
        options.silent = true;
      }
      {
        mode = "t";
        key = "<C-j>";
        action = "<C-\\><C-n><C-w>j";
        options.silent = true;
      }
      {
        mode = "t";
        key = "<C-k>";
        action = "<C-\\><C-n><C-w>k";
        options.silent = true;
      }
      {
        mode = "t";
        key = "<C-l>";
        action = "<C-\\><C-n><C-w>l";
        options.silent = true;
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
