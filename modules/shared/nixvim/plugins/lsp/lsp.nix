{ ... }:
{
  programs.nixvim = {
    lsp = {
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
        lua_ls = {
          enable = true;
        };
        nixd = {
          enable = true;
        };
        tailwindcss = {
          enable = true;
        };
        tsgo = {
          enable = true;
        };
      };
      keymaps = [
        {
          key = "gd";
          lspBufAction = "definition";
        }
        {
          key = "gD";
          lspBufAction = "references";
        }
        {
          key = "gt";
          lspBufAction = "type_definition";
        }
        {
          key = "gi";
          lspBufAction = "implementation";
        }
        {
          key = "K";
          lspBufAction = "hover";
        }
        {
          key = "<tab>";
          lspBufAction = "signature_help";
        }
        {
          key = "<leader>lr";
          lspBufAction = "rename";
          options.desc = "Rename";
        }
        {
          key = "gl";
          action.__raw = "vim.diagnostic.open_float";
        }
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

    plugins.lspconfig = {
      enable = true;
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>l";
        group = "LSP";
        icon = " ";
      }
    ];
  };
}
