{ ... }:
{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>h";
        group = "Harpoon";
        icon = " ";
      }
    ];

    keymaps = [
      {
        key = "<leader>hh";
        action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
        options.desc = "Toggle UI";
      }
      {
        key = "<leader>ha";
        action.__raw = "function() require'harpoon':list():add() end";
        options.desc = "Add file";
      }
      {
        key = "<leader>hj";
        action.__raw = "function() require'harpoon':list():select(1) end";
        options.desc = "Jump to [1]";
      }
      {
        key = "<leader>hk";
        action.__raw = "function() require'harpoon':list():select(2) end";
        options.desc = "Jump to [2]";
      }
      {
        key = "<leader>hl";
        action.__raw = "function() require'harpoon':list():select(3) end";
        options.desc = "Jump to [3]";
      }
    ];
  };
}
