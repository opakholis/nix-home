{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "fastaction";
        src = pkgs.fetchFromGitHub {
          owner = "Chaitanyabsprip";
          repo = "fastaction.nvim";
          rev = "77ae921e6fa6a8e2705768fa89b89b0e45840b94";
          hash = "sha256-2UuEORFTj4+gbuEm1D2FHXrRiU3pDsS5NG50Q9I1wuk=";
        };
      })
    ];
    extraConfigLua = ''
      require("fastaction").setup({})
    '';
  };
}
