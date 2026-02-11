{ ... }:
{
  programs.nixvim.plugins = {
    colorizer = {
      enable = true;
      lazyLoad.settings = {
        event = "BufReadPre";
      };
      settings = {
        user_default_options = {
          names = false; # "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
          names_custom = false; # Custom names to be highlighted: table|function|false
          RGB = true; # #RGB hex codes
          RGBA = true; # #RGBA hex codes
          RRGGBB = true; # #RRGGBB hex codes
          RRGGBBAA = false; # #RRGGBBAA hex codes
          AARRGGBB = false; # 0xAARRGGBB hex codes
          rgb_fn = false; # CSS rgb() and rgba() functions
          hsl_fn = false; # CSS hsl() and hsla() functions
          oklch_fn = false; # CSS oklch() function
          css = false; # Enable all CSS *features*: names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn, oklch_fn
          css_fn = false; # Enable all CSS *functions*: rgb_fn, hsl_fn, oklch_fn
          tailwind = false; # Enable tailwind colors. boolean|'normal'|'lsp'|'both'. True sets to 'normal'
          tailwind_opts = {
            update_names = false; # When using tailwind = 'both', update tailwind names from LSP results.
          };
          sass = {
            enable = false;
            parsers = [ "css" ];
          }; # Enable sass colors
          xterm = false; # Enable xterm 256-color codes (#xNN, \e[38;5;NNNm)
          mode = "virtualtext"; # Set the display mode. 'background'|'foreground'|'virtualtext'
          virtualtext = "●"; # Virtualtext character to use
          virtualtext_inline = true; # Display virtualtext inline with color. boolean|'before'|'after'. True sets to 'after'
          virtualtext_mode = "foreground"; # Virtualtext highlight mode: 'background'|'foreground'
          always_update = false; # update color values even if buffer is not focused. example use: cmp_menu, cmp_docs
        };
      };
    };
  };
}
