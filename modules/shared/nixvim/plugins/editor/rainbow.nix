{ ... }:
{
  programs.nixvim = {
    plugins.rainbow-delimiters = {
      enable = true;
      query = {
        default = "rainbow-delimiters";
        lua = "rainbow-blocks";
        html = "rainbow-tags";
        javascript = "rainbow-delimiters-react";
      };
    };
  };
}
