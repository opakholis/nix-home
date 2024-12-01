{ ... }:
let
  keymaps = [
    {
      mode = "n";
      key = "<leader>lla";
      action = "<cmd>TSToolsAddMissingImports<cr>";
      options = {
        desc = "Add Missing Imports";
      };
    }
    {
      mode = "n";
      key = "<leader>llr";
      action = "<cmd>TSToolsRemoveUnused<cr>";
      options = {
        desc = "Remove Unused Imports";
      };
    }
  ];
in
{
  programs.nixvim = {
    plugins.typescript-tools = {
      enable = true;
      settings = {
        handlers = {
          "textDocument/publishDiagnostics" = ''
            require("typescript-tools.api").filter_diagnostics({
              -- https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
              80001,
              7016,
            })
          '';
        };
      };
    };

    files."ftplugin/typescript.lua" = {
      keymaps = keymaps;
    };
    files."ftplugin/typescriptreact.lua" = {
      keymaps = keymaps;
    };
    files."ftplugin/javascript.lua" = {
      keymaps = keymaps;
    };
    files."ftplugin/javascriptreact.lua" = {
      keymaps = keymaps;
    };
  };
}
