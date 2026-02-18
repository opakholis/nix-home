{ ... }:
let
  winFloat = ''
    {
      position = "float",
      border = "single",
      width = 0.8,
      height = 0.8,
      wo = { winbar = "" }
    }
  '';
  winSplit = ''
    {
      position = "bottom",
      height = 0.2,
      wo = { winbar = "" }
    }
  '';
  winVSplit = ''
    {
      position = "right",
      width = 0.3,
      wo = { winbar = "" }
    }
  '';
in
{
  programs.nixvim = {
    plugins.snacks.settings.terminal = {
      enabled = true;
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>t";
        group = "Term";
        icon = " ";
      }
    ];

    keymaps = [
      {
        key = "<leader>tt";
        action.__raw = ''
          function()
            Snacks.terminal(nil, { win = ${winFloat} })
          end
        '';
        options.desc = "Terminal";
      }
      {
        key = "<leader>tv";
        action.__raw = ''
          function()
            Snacks.terminal(nil, { win = ${winVSplit} })
          end
        '';
        options.desc = "Terminal (vertical split)";
      }
      {
        key = "<leader>th";
        action.__raw = ''
          function()
            Snacks.terminal(nil, { win = ${winSplit} })
          end
        '';
        options.desc = "Terminal (horizontal split)";
      }
    ];
  };
}
