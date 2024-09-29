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
        eslint = {
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
        nixd = {
          enable = true;
        };
        ts-ls = {
          enable = true;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>lr" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>lf" = {
            action = "format";
            desc = "Format";
          };
          "<leader>la" = {
            action = "code_action";
            desc = "Code Action";
          };
        };
        diagnostic = {
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
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
