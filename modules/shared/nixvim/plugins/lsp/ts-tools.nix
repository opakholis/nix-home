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

  filetypes = [
    "typescript"
    "typescriptreact"
    "javascript"
    "javascriptreact"
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

    files = builtins.listToAttrs (
      map (ft: {
        name = "ftplugin/${ft}.lua";
        value = {
          keymaps = keymaps;
        };
      }) filetypes
    );
  };
}
