{ ... }:
{
  programs.nixvim = {
    plugins.rainbow-delimiters = {
      enable = true;
      settings.query = {
        default = "";
        lua = "rainbow-blocks";
        html = "rainbow-tags";
        javascript = "rainbow-delimiters-react";
      };
    };
  };
}
