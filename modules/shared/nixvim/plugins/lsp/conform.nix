{ config, pkgs, ... }:
let
  helpers = config.lib.nixvim;
in
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      nixfmt-rfc-style
      prettierd
      stylua
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft =
          let
            prettier = {
              __unkeyed-1 = "eslint_d";
              __unkeyed-2 = "prettierd";
              stop_after_first = true;
            };
          in
          {
            lua = [ "stylua" ];
            nix = [ "nixfmt" ];
            javascript = prettier;
            javascriptreact = prettier;
            typescript = prettier;
            typescriptreact = prettier;
          };
        format_after_save = {
          lsp_format = "fallback";
        };
      };
    };
  };
}