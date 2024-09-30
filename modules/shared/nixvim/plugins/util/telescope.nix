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
            horizontal = {
              prompt_position = "top";
            };
          };
          sorting_strategy = "ascending";
          file_ignore_patterns = [
            "^.git/"
            "^.github/"
            "^.vscode/"
            "^gradle/"
            "^node_modiules/*"
            "%.lock"
          ];
          set_env.COLORTERM = "truecolor";
        };
      };
    };
  };
}
