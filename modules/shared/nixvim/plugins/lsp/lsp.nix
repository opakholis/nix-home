{ ... }:
{
  programs.nixvim = {
    plugins.lspkind = {
      enable = true;
      cmp = {
        enable = true;
        menu = {
          nvim_lsp = "[LSP]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
        };
      };
    };
    plugins.lsp = {
      enable = true;
      servers = {
        cssls = {
          enable = true;
        };
        html = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };
        lua-ls = {
          enable = true;
        };
        nil-ls = {
          enable = true;
        };
        ts-ls = {
          enable = true;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          K = "hover";
          gh = "hover";
          gr = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
          "<tab>" = "signature_help";
          "<leader>lr" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>la" = {
            action = "code_action";
            desc = "Code Action";
          };
        };
        extra = [
          {
            mode = "n";
            key = "<leader>lf";
            action = "<cmd>lua require('conform').format()<cr>";
            options = {
              desc = "Format";
            };
          }
        ];
        diagnostic = {
          "[d" = "goto_next";
          "]d" = "goto_prev";
          "gl" = "open_float";
        };
      };
    };
    extraConfigLuaPre = ''
      do
        local diagnostic_signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
        for type, icon in pairs(diagnostic_signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
      end
    '';
    extraConfigLua = ''
      -- Change border of documentation hover window
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, { border = "rounded" }
      )

      -- Change border of signature help info
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, { border = "rounded" }
      )

      -- Change border of LSP Info
      require('lspconfig.ui.windows').default_options = {
        border = "rounded"
      }
    '';
  };
}
