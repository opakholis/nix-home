{ ... }:
{
  programs.nixvim = {
    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        experimental = {
          ghost_text = false;
          native_menu = false;
        };
        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };
        performance = {
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        sources = [
          {
            name = "copilot";
          }
          {
            name = "nvim_lsp";
          }
          {
            name = "path";
            group_index = 2;
            max_item_count = 5;
          }
          {
            name = "buffer";
            group_index = 2;
            keyword_length = 5;
            max_item_count = 5;
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
        ];

        completion = {
          keyword_length = 1;
          completeopt = "menu,menuone,noinsert";
        };

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-c>" = "cmp.mapping.abort()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";

          # Scroll the documentation window
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";

          # More traditional completion keymaps
          "<CR>" = "cmp.mapping.confirm { select = true }";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
  };
}
