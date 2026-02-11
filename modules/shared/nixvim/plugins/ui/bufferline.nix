{ ... }:
{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      lazyLoad.settings = {
        event = "DeferredUIEnter";
      };
      settings = {
        options = {
          always_show_bufferline = false;
          mode = "buffers";
          diagnostics = "nvim_lsp";
          close_command.__raw = ''
            function(bufnr)
              buf_kill("bd", bufnr, false)
            end
          '';
          close_icon = " ";
          buffer_close_icon = " ";
          modified_icon = " ";
          offsets = [
            {
              filetype = "NvimTree";
              text = "Explorer";
              highlight = "PanelHeading";
              padding = 1;
            }
          ];
        };
      };
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>b";
        group = "Buffer";
        icon = " ";
      }
      {
        __unkeyed = "<leader>q";
        group = "Quit";
        icon = " ";
      }
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>lua buf_kill()<cr>";
        options = {
          desc = "Close";
        };
      }
      {
        mode = "n";
        key = "<leader>ba";
        action = "<cmd>BufferLineCloseOthers<cr>";
        options = {
          desc = "Close all";
        };
      }
      {
        mode = "n";
        key = "<leader>bl";
        action = "<cmd>BufferLineCloseRight<cr>";
        options = {
          desc = "Close all to the right";
        };
      }
      {
        mode = "n";
        key = "<leader>bh";
        action = "<cmd>BufferLineCloseLeft<cr>";
        options = {
          desc = "Close all to the left";
        };
      }
      {
        mode = "n";
        key = "<leader>bf";
        action = "<cmd>lua Snacks.picker.buffers()<cr>";
        options = {
          desc = "Find";
        };
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<cr>";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<cr>";
      }
      {
        mode = "n";
        key = "<S-tab>";
        action = "<c-6>"; # switch to last buffer
      }
    ];

    extraConfigLua = ''
      -- Common kill function for bdelete and bwipeout
      -- Credits: Based on bbye and nvim-bufdel from LunarVim
      -- Source: https://github.com/LunarVim/LunarVim/blob/85ccca97acfea9a465e354e18bb2f6109ba417f8/lua/lvim/core/bufferline.lua#L184
      function buf_kill(kill_command, bufnr, force)
        kill_command = kill_command or "bd"

        local bo = vim.bo
        local api = vim.api
        local fmt = string.format
        local fn = vim.fn

        if bufnr == 0 or bufnr == nil then
          bufnr = api.nvim_get_current_buf()
        end

        local bufname = api.nvim_buf_get_name(bufnr)

        if not force then
          local choice
          if bo[bufnr].modified then
            choice = fn.confirm(fmt([[Save changes to "%s"?]], bufname), "&Yes\n&No\n&Cancel")
            if choice == 1 then
              vim.api.nvim_buf_call(bufnr, function()
                vim.cmd("w")
              end)
            elseif choice == 2 then
              force = true
            else return
            end
          elseif api.nvim_get_option_value("buftype", { buf = 0 }) == "terminal" then
            choice = fn.confirm(fmt([[Close "%s"?]], bufname), "&Yes\n&No\n&Cancel")
            if choice == 1 then
              force = true
            else
              return
            end
          end
        end

        -- Get list of windows IDs with the buffer to close
        local windows = vim.tbl_filter(function(win)
          return api.nvim_win_get_buf(win) == bufnr
        end, api.nvim_list_wins())

        if force then
          kill_command = kill_command .. "!"
        end

        -- Get list of active buffers
        local buffers = vim.tbl_filter(function(buf)
          return api.nvim_buf_is_valid(buf) and bo[buf].buflisted
        end, api.nvim_list_bufs())

        -- If there is only one buffer (which has to be the current one), vim will
        -- create a new buffer on :bd.
        -- For more than one buffer, pick the previous buffer (wrapping around if necessary)
        if #buffers > 1 and #windows > 0 then
          for i, v in ipairs(buffers) do
            if v == bufnr then
              local prev_buf_idx = i == 1 and #buffers or (i - 1)
              local prev_buffer = buffers[prev_buf_idx]
              for _, win in ipairs(windows) do
                api.nvim_win_set_buf(win, prev_buffer)
              end
            end
          end
        end

        -- Check if buffer still exists, to ensure the target buffer wasn't killed
        -- due to options like bufhidden=wipe.
        if api.nvim_buf_is_valid(bufnr) and bo[bufnr].buflisted then
          vim.cmd(string.format("%s %d", kill_command, bufnr))
        end
      end
    '';
  };
}
