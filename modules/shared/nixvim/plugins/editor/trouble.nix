{ ... }:
{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
      settings = {
        auto_close = true;
      };
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>x";
        group = "Trouble";
        icon = " ";
      }
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics<cr>";
        options = {
          desc = "Diagnostics";
        };
      }
    ];
  };
}
