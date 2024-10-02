{ ... }:
{
  programs.nixvim.plugins = {
    which-key = {
      enable = true;
      settings = {
        delay = 500;
        disable = {
          ft = [
            "TelescopePrompt"
          ];
        };
        icons = {
          breadcrumb = "/";
          separator = "·";
          group = "";
        };
        layout = {
          spacing = 8;
        };
        plugins = {
          marks = false;
          registers = false;
          presets = {
            motions = false;
            nav = false;
            operators = false;
            text_objects = false;
          };
        };
        preset = "classic";
        spec = [
          {
            __unkeyed = "<leader>b";
            group = "Buffer";
            icon = "󰊓 ";
          }
          {
            __unkeyed = "<leader>l";
            group = "LSP";
            icon = " ";
          }
          {
            __unkeyed = "<leader>s";
            group = "Search";
            icon = " ";
          }
          {
            __unkeyed = "<leader>g";
            group = "Git";
            icon = " ";
          }
          {
            __unkeyed = "<leader>t";
            group = "Term";
            icon = "󰙀 ";
          }
          {
            __unkeyed = "<leader>q";
            group = "Quit";
            icon = "󰗼  ";
          }
        ];
        triggers = [
          {
            __unkeyed = "<leader>";
            mode = [
              "n"
              "v"
            ];
          }
        ];
        win = {
          border = "single";
          padding = [
            2
            0
          ];
        };
      };
    };
  };
}
