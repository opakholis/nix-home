{ ... }:
{
  programs.nixvim.plugins = {
    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "catppuccin";
          globalstatus = true;
          disabled_filetypes = {
            statusline = [
              "alpha"
              "startify"
              "Trouble"
            ];
            winbar = [
              "startify"
              "alpha"
            ];
          };
          component_separators = {
            left = "";
            right = "";
          };
          section_separators = {
            left = "";
            right = "";
          };
        };
        # +-------------------------------------------------+
        # | A | B | C                             X | Y | Z |
        # +-------------------------------------------------+
        sections = {
          lualine_a = [
            {
              __unkeyed-1.__raw = ''
                function()
                  return "󰀘 "
                end
              '';
            }
          ];

          lualine_b = [
            {
              __unkeyed-1 = "branch";
              icon = " ";
            }
          ];
          lualine_c = [
            {
              __unkeyed-1 = "diff";
              symbols = {
                added = " ";
                modified = " ";
                removed = " ";
              };
            }
          ];
          lualine_x = [ "diagnostics" ];
          lualine_y = [ "filetype" ];
          lualine_z = [ "location" ];
        };
      };
    };
  };
}
