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
          hop = true;
          gitsigns = true;
          indent_blankline.enabled = true;
          lsp_trouble = true;
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

              -- plugin
              TroubleNormal = { bg = cp.none },

              -- treesitter
              ["@field"] = { fg = cp.rosewater },
              ["@property"] = { fg = cp.yellow },

              ["@include"] = { fg = cp.teal },
              ["@operator"] = { fg = cp.sky },
              ["@keyword.operator"] = { fg = cp.sky },
              ["@punctuation.special"] = { fg = cp.maroon },

              ["@constructor"] = { fg = cp.lavender },
              ["@exception"] = { fg = cp.peach },

              ["@constant.builtin"] = { fg = cp.lavender },
              ["@variable.builtin"] = { fg = cp.red, style = { "italic" } },

              ["@function.macro"] = { fg = cp.red, style = {} },
              ["@parameter"] = { fg = cp.rosewater },
              ["@keyword.function"] = { fg = cp.maroon },
              ["@keyword"] = { fg = cp.red },
              ["@keyword.return"] = { fg = cp.pink, style = {} },

              ["@method"] = { style = { "italic" } },
              ["@namespace"] = { fg = cp.rosewater, style = {} },

              ["@punctuation.delimiter"] = { fg = cp.teal },
              ["@punctuation.bracket"] = { fg = cp.overlay2 },
              ["@variable"] = { fg = cp.text },
              ["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
              ["@tag"] = { fg = cp.peach },
              ["@tag.delimiter"] = { fg = cp.maroon },
              ["@text"] = { fg = cp.text },
            }
          end
        '';
      };
    };
  };
}
