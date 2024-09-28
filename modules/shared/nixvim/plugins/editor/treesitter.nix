{ ... }:
{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      settings = {
        ensureInstalled = [
          "astro"
          "bash"
          "css"
          "diff"
          "git_config"
          "git_rebase"
          "gitattributes"
          "gitcommit"
          "gitignore"
          "html"
          "javascript"
          "json"
          "jsonc"
          "lua"
          "luadoc"
          "markdown"
          "markdown_inline"
          "regex"
          "query"
          "tsx"
          "typescript"
          "vim"
          "vimdoc"
          "yaml"
        ];

        highlight = {
          enable = true;

          # Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          additional_vim_regex_highlighting = true;
        };

        indent = {
          enable = true;
          disable = [
            "ruby"
          ];
        };
      };
    };
  };
}
