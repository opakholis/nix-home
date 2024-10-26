{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      eslint_d
    ];

    plugins.lint = {
      enable = true;
      lintersByFt = {
        nix = [ "nix" ];
        javascript = [ "eslint_d" ];
        javascriptreact = [ "eslint_d" ];
        typescriptreact = [ "eslint_d" ];
        typescript = [ "eslint_d" ];
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
      local lint = require("lint")
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    '';
  };
}
