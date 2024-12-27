{ ... }:
{
  programs.nixvim = {
    plugins.lspkind = {
      enable = true;
      symbolMap = {
        Copilot = "";
      };
      cmp = {
        enable = true;
        maxWidth = 70;
        menu = {
          nvim_lsp = "[LSP]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
          copilot = "[AI]";
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
        lua_ls = {
          enable = true;
        };
        nixd = {
          enable = true;
        };
        tailwindcss = {
          enable = true;
        };
        ts_ls = {
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
        };
        diagnostic = {
          "<leader>lj" = {
            action = "goto_prev";
            desc = "Previous diagnostic";
          };
          "<leader>lk" = {
            action = "goto_next";
            desc = "Next diagnostic";
          };
          "gl" = "open_float";
        };
        extra = [
          {
            mode = "n";
            key = "<leader>la";
            action = "<cmd>lua require('fastaction').code_action()<cr>";
            options = {
              desc = "Code action";
              silent = true;
              buffer = true;
            };
          }
          {
            mode = "n";
            key = "<leader>lf";
            action = "<cmd>lua require('conform').format()<cr>";
            options = {
              desc = "Format";
              silent = true;
            };
          }
        ];
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
