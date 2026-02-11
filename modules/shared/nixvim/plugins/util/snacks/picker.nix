{ ... }:
{
  programs.nixvim = {
    plugins.snacks.settings.picker = {
      enabled = true;
      layout = {
        backdrop = 100;
      };
      matcher = {
        frecency = true;
      };
      sort = {
        fields = [
          "score:desc"
          "idx"
        ];
      };
      icons = {
        ui = {
          hidden = " ";
          # live = "󰐰 ";
          # ignored = "i";
          # follow = "f";
          # selected = "● ";
          # unselected = "○ ";
          # selected = " ";
        };
      };
      ui_select = true;
      formatters = {
        file = {
          filename_first = true;
        };
      };
      sources = {
        buffers = {
          hidden = true;
        };
        files = {
          hidden = true;
        };
        grep = {
          hidden = true;
        };
        explorer = {
          layout = {
            preset = "sidebar";
          };
        };
      };
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>s";
        group = "Search";
        icon = " ";
      }
      {
        __unkeyed = "<leader>f";
        group = "Find";
        icon = " ";
      }
      {
        __unkeyed = "<leader>gf";
        group = "Find";
        icon = " ";
      }
    ];

    keymaps = [
      # Find
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>lua Snacks.picker.files()<CR>";
        options = {
          desc = "Find files";
        };
      }
      {
        mode = "n";
        key = "<leader>ft";
        action = "<cmd>lua Snacks.picker.grep()<CR>";
        options = {
          desc = "Find text";
        };
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>lua Snacks.picker.lines()<CR>";
        options = {
          desc = "Find buffer lines";
        };
      }
      {
        mode = "n";
        key = "<leader>fl";
        action = "<cmd>lua Snacks.picker.resume()<CR>";
        options = {
          desc = "Last action";
        };
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<cmd>lua Snacks.picker.recent()<CR>";
        options = {
          desc = "Find recent files";
        };
      }

      # Search
      {
        mode = "n";
        key = "<leader>sh";
        action = "<cmd>lua Snacks.picker.help()<CR>";
        options = {
          desc = "Help pages";
        };
      }
      {
        mode = "n";
        key = "<leader>sk";
        action = "<cmd>lua Snacks.picker.keymaps()<CR>";
        options = {
          desc = "Keymaps";
        };
      }
      {
        mode = "n";
        key = "<leader>sm";
        action = "<cmd>lua Snacks.picker.man()<CR>";
        options = {
          desc = "Man pages";
        };
      }

      # Git
      {
        mode = "n";
        key = "<leader>gfb";
        action = "<cmd>lua Snacks.picker.git_branches()<CR>";
        options = {
          desc = "Branches";
        };
      }
      {
        mode = "n";
        key = "<leader>gfl";
        action = "<cmd>lua Snacks.picker.git_log()<CR>";
        options = {
          desc = "Log";
        };
      }
      {
        mode = "n";
        key = "<leader>gff";
        action = "<cmd>lua Snacks.picker.git_log_file()<CR>";
        options = {
          desc = "Log buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>gs";
        action = "<cmd>lua Snacks.picker.git_status()<CR>";
        options = {
          desc = "Status";
        };
      }
    ];
  };
}
