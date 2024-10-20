{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "cinnamon";
        src = pkgs.fetchFromGitHub {
          owner = "declancm";
          repo = "cinnamon.nvim";
          rev = "450cb3247765fed7871b41ef4ce5fa492d834215";
          hash = "sha256-kccQ4iFMSQ8kvE7hYz90hBrsDLo7VohFj/6lEZZiAO8=";
        };
      })
    ];
    extraConfigLua = ''
      require("cinnamon").setup {
        keymaps = {
          basic = true,
          extra = true,
        },
        max_delta = {
          time = 100,
        },
      }
    '';
  };
}
