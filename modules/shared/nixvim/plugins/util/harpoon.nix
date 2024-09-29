{ ... }:
{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      keymapsSilent = true;
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>h";
        group = "Harpoon";
        icon = " ";
      }
    ];

    keymaps = [
      {
        key = "<leader>hh";
        action = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>";
        options.desc = "Toggle UI";
      }
      {
        key = "<leader>ha";
        action = "<cmd>lua require('harpoon.mark').add_file()<cr>";
        options.desc = "Add file";
      }
      {
        key = "<leader>hj";
        action = "<cmd>lua require('harpoon.ui').nav_file(1)<cr>";
        options.desc = "Jump to [1]";
      }
      {
        key = "<leader>hk";
        action = "<cmd>lua require('harpoon.ui').nav_file(2)<cr>";
        options.desc = "Jump to [2]";
      }
      {
        key = "<leader>hl";
        action = "<cmd>lua require('harpoon.ui').nav_file(3)<cr>";
        options.desc = "Jump to [3]";
      }
    ];
  };
}
