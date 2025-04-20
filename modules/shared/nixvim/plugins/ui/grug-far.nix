{ ... }:
{
  programs.nixvim = {
    plugins.grug-far = {
      enable = true;
      lazyLoad.settings = {
        cmd = "GrugFar";
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>sr";
        action = "<cmd>GrugFar<cr>";
        options = {
          desc = "Find and Replace";
        };
      }
    ];
  };
}
