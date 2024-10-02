{ ... }:
{
  programs.nixvim = {
    plugins.copilot-cmp = {
      enable = true;
    };
    plugins.copilot-lua = {
      enable = true;
      filetypes = {
        "*" = true;
      };
      panel = {
        enabled = false;
      };
      suggestion = {
        enabled = false;
        autoTrigger = true;
        keymap = {
          accept = "<C-a>";
          dismiss = "<C-d>";
          next = "<C-]>";
          prev = "<C-[>";
        };
      };
    };
  };
}
