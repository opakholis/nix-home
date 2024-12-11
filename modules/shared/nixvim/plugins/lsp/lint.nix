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
          rev = "e6bf849d1cc427e594b738b372aaf424541b953b";
          hash = "sha256-FZibT6ocWhYfW3nka6o0HWFUi/jkPD1BrPzaVYyZ/yc=";
        };
      })
    ];

    plugins.lint = {
      enable = true;
      lintersByFt = {
        nix = [ "nix" ];
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>lc";
        action.__raw = ''
          function()
            require("lint").try_lint()
          end
        '';
        options = {
          desc = "Lint";
        };
      }
    ];

    extraConfigLua = ''
      require('nvim-eslint').setup({})
    '';
  };
}
