{ ... }:
{
  programs.nixvim = {
    plugins.nvim-tree = {
      enable = true;
      autoClose = true;
      settings = {
        hijack_cursor = true;
        modified.enable = true;
        update_focused_file.enable = true;
        filters = {
          custom = [
            "node_modules"
            "^\.git"
            "^\.cache"
          ];
        };
        renderer = {
          indent_markers.enable = true;
          highlight_git = true;
          root_folder_label = false;
          icons = {
            show.git = false;
          };
        };
        on_attach.__raw = ''
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
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>e";
        __unkeyed-2 = "<cmd>NvimTreeToggle<CR>";
        desc = "Explorer";
        icon = " ";
      }
    ];
  };
}
