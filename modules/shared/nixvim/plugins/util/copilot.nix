{ ... }:
{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
      settings = {
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
  };
}
