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
          { name = "nvim_lsp"; }
          {
            name = "path";
            groupIndex = 2;
            keywordLength = 5;
          }
          {
            name = "luasnip";
            groupIndex = 2;
          }
          {
            name = "buffer";
            groupIndex = 2;
            keywordLength = 5;
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
        ];

        snippet = {
          expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };

        completion = {
          keyword_length = 3;
          completeopt = "menu,menuone,noinsert";
        };

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";

          # Scroll the documentation window [b]ack / [f]orward
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";

          # More traditional completion keymaps
          "<CR>" = "cmp.mapping.confirm { select = true }";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";

          # Moving to the right of our snippet expansion.
          # For more advanced Luasnip keymap, see:
          # https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
          "<C-l>" = ''
            cmp.mapping(function()
              if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              end
            end, { 'i', 's' })
          '';
          "<C-h>" = ''
            cmp.mapping(function()
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              end
            end, { 'i', 's' })
          '';
        };
        extraConfigLua = ''
          luasnip = require("luasnip")
          kind_icons = {
            Text = "󰊄",
            Method = " ",
            Function = "󰡱 ",
            Constructor = " ",
            Field = " ",
            Variable = "󱀍 ",
            Class = " ",
            Interface = " ",
            Module = "󰕳 ",
            Property = " ",
            Unit = " ",
            Value = " ",
            Enum = " ",
            Keyword = " ",
            Snippet = " ",
            Color = " ",
            File = "",
            Reference = " ",
            Folder = " ",
            EnumMember = " ",
            Constant = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
          } 
        '';
      };
    };
  };
}
