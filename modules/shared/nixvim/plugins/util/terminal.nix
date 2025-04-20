{ ... }:
{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      lazyLoad.settings = {
        cmd = "ToggleTerm";
        keys = [
          "<leader>tt"
          "<leader>gg"
        ];
      };
      settings = {
        shade_terminals = false;
      };
    };

    plugins.lazygit = {
      enable = true;
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>t";
        group = "Term";
        icon = " ";
      }
    ];

    keymaps = [
      {
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
        options.desc = "Lazygit";
      }
      {
        key = "<leader>tt";
        action = "<cmd>ToggleTerm direction=float<cr>";
        options.desc = "Terminal to float";
      }
      {
        key = "<leader>tb";
        action = "<cmd>ToggleTerm direction=horizontal size=10<cr>";
        options.desc = "Terminal to below";
      }
      {
        key = "<leader>tr";
        action = "<cmd>ToggleTerm direction=vertical size=50<cr>";
        options.desc = "Terminal to right";
      }
    ];
  };
}
