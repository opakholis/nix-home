{ ... }:
{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      lazyLoad.enable = true;
      settings = {
        flavour = "frappe";
        transparent_background = false;
        float = {
          transparent = false;
          solid = true;
        };
        term_colors = true;
        lsp_styles = {
          underlines = {
            errors = [ "undercurl" ];
            hints = [ "undercurl" ];
            warnings = [ "undercurl" ];
            information = [ "undercurl" ];
            ok = [ "undercurl" ];
          };
          inlay_hints = {
            background = true;
          };
        };
        integrations = {
          alpha = true;
          blink_cmp = true;
          gitsigns = true;
          harpoon = true;
          hop = true;
          illuminate = {
            enable = true;
            lsp = true;
          };
          indent_blankline.enabled = true;
          lsp_trouble = true;
          nvimtree = true;
          snacks.enabled = true;
          treesitter = true;
          which_key = true;
        };
        custom_highlights.__raw = ''
          function(cp)
            return {
              -- base config
              TabLineSel = { bg = cp.pink },

              -- plugin
              TroubleNormal = { bg = cp.none },
              NvimTreeNormal = { bg = cp.none },

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

    plugins.bufferline = {
      settings.highlights.__raw = ''
        require("catppuccin.special.bufferline").get_theme()
      '';
    };
  };
}
