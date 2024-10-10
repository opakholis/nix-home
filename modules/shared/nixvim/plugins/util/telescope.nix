{ ... }:
{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        file-browser = {
          enable = true;
        };
        ui-select = {
          enable = true;
        };
        fzf-native = {
          enable = true;
        };
      };
      keymaps = {
        # File and text
        "<leader>ss" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>sw" = {
          action = "live_grep";
          options.desc = "Find text";
        };
        "<leader>sl" = {
          action = "resume";
          options.desc = "Last search";
        };

        # Meh
        "<leader>sk" = {
          action = "keymaps";
          options.desc = "View keymaps";
        };
        "<leader>sm" = {
          action = "man_pages";
          options.desc = "View man pages";
        };

        # Git
        "<leader>gb" = {
          action = "git_branches";
          options.desc = "View git branches";
        };
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "View git commits";
        };
        "<leader>gC" = {
          action = "git_bcommits";
          options.desc = "View git commits (current buffer)";
        };
        "<leader>gs" = {
          action = "git_status";
          options.desc = "View git status";
        };
      };
      settings = {
        defaults = {
          layout_config = {
            width = 0.85;
            height = 0.75;
            preview_cutoff = 120;
            prompt_position = "top";
            horizontal = {
              preview_width.__raw = ''
                function(_, cols, _)
                  return math.floor(cols * 0.5)
                end
              '';
            };
            vertical = {
              width = 0.5;
              height = 0.6;
              preview_height = 0.5;
            };
            flex = {
              horizontal = {
                preview_width = 0.8;
              };
            };
          };
          path_display = [ "smart" ];
          prompt_prefix = "  ";
          selection_caret = "  ";
          results_title = false;
          sorting_strategy = "ascending";
          file_ignore_patterns = [
            "^.git/"
            "^.github/"
            "^.vscode/"
            "^gradle/"
            "^node_modules/*"
            "%.lock"
            # media
            "%.jpg"
            "%.jpeg"
            "%.png"
            "%.svg"
            "%.webp"
            # fonts
            "%.otf"
            "%.ttf"
            "%.woff"
            "%.woff2"
          ];
          set_env.COLORTERM = "truecolor";
        };
      };
    };
  };
}
