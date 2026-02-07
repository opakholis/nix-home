{ ... }:
{
  programs.nixvim = {
    plugins.codediff = {
      enable = true;
      settings = {
        explorer = {
          file_filter.ignore = [ "*.lock" ];
        };
        highlights = {
          char_brightness = 1.4;
        };
      };
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>gd";
        group = "Diff";
        icon = " ";
      }
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>gdd";
        action = "<cmd>CodeDiff<cr>";
        options.desc = "Diff Open";
      }
      {
        mode = "n";
        key = "<leader>gdh";
        action = "<cmd>CodeDiff history %<cr>";
        options.desc = "File History";
      }
    ];
  };
}
