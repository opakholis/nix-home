{ ... }:
{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
      lazyLoad.settings = {
        event = "InsertEnter";
      };
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
