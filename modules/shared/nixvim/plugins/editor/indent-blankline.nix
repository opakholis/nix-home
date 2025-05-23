{ ... }:
{
  programs.nixvim = {
    plugins.indent-blankline = {
      enable = true;
      lazyLoad.settings = {
        event = "DeferredUIEnter";
      };
      settings = {
        indent = {
          char = "│"; # "│" or "▎"
        };
        scope = {
          show_end = false;
          show_start = false;
        };
        exclude = {
          buftypes = [
            "nofile"
            "terminal"
            "quickfix"
          ];
          filetypes = [
            ""
            "checkhealth"
            "help"
            "lspinfo"
            "packer"
            "TelescopePrompt"
            "TelescopeResults"
            "yaml"
          ];
        };
      };
    };
  };
}
