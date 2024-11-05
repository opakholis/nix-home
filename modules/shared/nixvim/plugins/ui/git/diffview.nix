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
      enhancedDiffHl = true;
      keymaps = {
        view = mappings;
        filePanel = mappings;
        fileHistoryPanel = mappings;
      };
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>gd";
        group = "Diff";
        icon = " ";
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
