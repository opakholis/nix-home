{ ... }:
{
  programs.nixvim = {
    autoGroups = {
      highlight_yank = { };
      restore_cursor = { };
      lazy_close = { };

    };

    autoCmd = [
      {
        group = "highlight_yank";
        event = [ "TextYankPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
        };
      }

      # Restore cursor position when opening a file
      # from NVChad https://nvchad.com/docs/recipes
      {
        group = "restore_cursor";
        event = [ "BufReadPost" ];
        pattern = "*";
        callback = {
          __raw = ''
            function()
              if
                vim.fn.line "'\"" > 1
                and vim.fn.line "'\"" <= vim.fn.line "$"
                and vim.bo.filetype ~= "commit"
                and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
              then
                vim.cmd "normal! g`\""
              end
            end
          '';
        };
      }

      # Close certain filetypes with q
      {
        group = "lazy_close";
        event = [ "FileType" ];
        pattern = [
          "help"
          "man"
          "qf"
        ];
        callback = {
          __raw = ''
            function(event)
              vim.bo[event.buf].buflisted = false
              vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
            end
          '';
        };
      }
    ];
  };
}
