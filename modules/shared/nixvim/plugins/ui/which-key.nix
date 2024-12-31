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
          border = "rounded";
          padding = [
            2
            0
          ];
        };
      };
    };
  };
}
