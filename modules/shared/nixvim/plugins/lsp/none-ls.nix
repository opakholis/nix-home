{ ... }:
{
  programs.nixvim = {
    plugins.none-ls = {
      enable = true;
      sources = {
        code_actions = {
          gitsigns.enable = true;
        };
        formatting = {
          nixpkgs_fmt.enable = true;
          prettierd.enable = true;
        };
      };
    };
  };
}
