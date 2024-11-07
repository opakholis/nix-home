{ ... }:
{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      autoClose = true;
      hijackCursor = true;
      modified.enable = true;
      filters = {
        custom = [
          "node_modules"
          "^\.git"
          "^\.cache"
        ];
      };
      renderer = {
        highlightGit = true;
        rootFolderLabel = false;
        indentMarkers = {
          enable = true;
        };
        icons = {
          show.git = false;
        };
      };
      updateFocusedFile = {
        enable = true;
      };
      onAttach.__raw = ''
        function (bufnr)
          local api = require "nvim-tree.api"
          local function opts(desc)
            return {
              desc = "nvim-tree: " .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true
            }
          end

          api.config.mappings.default_on_attach(bufnr)

          local mappings = {
            ["l"] = { api.node.open.edit, opts "Open" },
            ["o"] = { api.node.open.edit, opts "Open" },
            ["<CR>"] = { api.node.open.edit, opts "Open" },
            ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },
            ["h"] = { api.node.navigate.parent_close, opts "Close Directory" },
            ["C"] = { api.tree.change_root_to_node, opts "CD" },
          }

          for k, v in pairs(mappings) do
            vim.keymap.set('n', k, v[1], v[2])
          end
        end
      '';
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<cr>";
        options = {
          desc = "Explorer";
          silent = true;
        };
      }
    ];
  };
}
