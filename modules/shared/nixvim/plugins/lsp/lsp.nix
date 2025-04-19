{ ... }:
{
  programs.nixvim = {
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

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>l";
        group = "LSP";
        icon = "󱐋";
      }
    ];
  };
}
