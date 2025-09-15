{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      eslint_d
    ];

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "esmuellert";
        src = pkgs.fetchFromGitHub {
          owner = "esmuellert";
          repo = "nvim-eslint";
          rev = "bcab40ed268b869cce8fde8e91d1c51ec26e5019";
          hash = "sha256-pLWt/cNZiGZyMr+/Ana8Rk+yl7VNOp1Pw1m56EpVWLY=";
        };
      })
    ];

    plugins.lint = {
      enable = true;
      lintersByFt = {
        nix = [ "nix" ];
      };
    };

    extraConfigLua = ''
      require('nvim-eslint').setup({})
    '';
  };
}
