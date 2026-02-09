{ ... }:
{
  programs.nixvim = {
    plugins.blink-copilot = {
      enable = true;
    };

    plugins.blink-cmp = {
      enable = true;
      settings = {
        cmdline = {
          keymap.preset = "inherit";
          completion = {
            menu.auto_show = true;
          };
        };
        completion = {
          menu = {
            border = "rounded";
            draw.columns = [
              {
                __unkeyed-1 = "label";
              }
              {
                __unkeyed-1 = "kind_icon";
                __unkeyed-2 = "kind";
                gap = 1;
              }
              {
                __unkeyed-1 = "source_name";
              }
            ];
          };
          documentation = {
            auto_show = true;
            window.border = "rounded";
          };
        };
        signature = {
          enabled = true;
          window.border = "rounded";
        };
        sources = {
          default = [
            "lsp"
            "path"
            "buffer"
            "copilot"
          ];
          providers = {
            buffer = {
              score_offset = -5;
              min_keyword_length = 5;
              max_items = 5;
            };
            path = {
              score_offset = -5;
              max_items = 5;
            };
            lsp = {
              score_offset = 10;
            };
            copilot = {
              async = true;
              module = "blink-copilot";
              name = "AI";
              score_offset = 100;
              opts = {
                max_completions = 2;
                max_attempts = 4;
                kind = "Copilot";
                debounce = 750;
                auto_refresh = {
                  backward = true;
                  forward = true;
                };
              };
            };
          };
        };
        keymap = {
          preset = "default";
          "<C-k>" = [
            "select_prev"
            "fallback"
          ];
          "<C-j>" = [
            "select_next"
            "fallback"
          ];
          "<C-d>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<C-u>" = [
            "scroll_documentation_up"
            "fallback"
          ];
        };
      };
    };
  };
}
