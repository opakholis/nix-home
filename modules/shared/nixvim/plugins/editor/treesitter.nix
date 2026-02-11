{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        astro
        bash
        comment
        css
        diff
        gitcommit
        html
        javascript
        json
        json5
        lua
        markdown
        markdown_inline
        nix
        regex
        styled
        tsx
        typescript
        vim
        vimdoc
        yaml
      ];
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = true;
      };
      indent = {
        enable = true;
        disable = [
          "ruby"
        ];
      };
    };

    plugins.ts-autotag = {
      enable = true;
    };

    plugins.ts-context-commentstring = {
      enable = true;
    };
  };
}
