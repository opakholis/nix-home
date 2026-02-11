{ ... }:
{
  programs.nixvim = {
    plugins.snacks.settings.lazygit = {
      enabled = true;
    };

    keymaps = [
      {
        key = "<leader>gg";
        action = "<cmd>lua Snacks.lazygit.open()<cr>";
        options.desc = "Lazygit";
      }
    ];
  };
}
