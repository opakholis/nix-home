{ ... }:
let
  mappings = [
    {
      mode = "n";
      key = "q";
      action = "<cmd>DiffviewClose<cr>";
      description = "Close panel";
    }
  ];
in
{
  programs.nixvim = {
    plugins.diffview = {
      enable = true;
      settings = {
        enhanced_diff_hl = true;
        keymaps = {
          view = mappings;
          file_panel = mappings;
          file_history_panel = mappings;
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
        action = "<cmd>DiffviewOpen<cr>";
        options.desc = "Diff Open";
      }
      {
        mode = "n";
        key = "<leader>gdh";
        action = "<cmd>DiffviewFileHistory %<cr>";
        options.desc = "File History";
      }
    ];
  };
}
