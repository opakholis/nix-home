{ ... }:
{
  programs.nixvim.colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        flavour = "frappe";
        transparent_background = false;
        term_colors = true;
        integrations = {
          alpha = true;
          cmp = true;
          harpoon = true;
          gitsigns = true;
          indent_blankline.enabled = true;
          native_lsp.enabled = true;
          nvimtree = true;
          treesitter = true;
          telescope = {
            enable = true;
            style = "nvchad";
          };
          which_key = true;
        };
        custom_highlights = ''
          function(cp)
            return {
            -- base config
            NormalFloat = { bg = cp.none },
            Pmenu = { bg = cp.none },
            PmenuBar = { bg = cp.surface0 },
            TabLineSel = { bg = cp.pink },
            }
          end
        '';
      };
    };
  };
}
