{ ... }:
{
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      settings = {
        ensure_installed = [
          "astro"
          "bash"
          "css"
          "html"
          "javascript"
          "json"
          "jsonc"
          "lua"
          "luadoc"
          "markdown"
          "markdown_inline"
          "regex"
          "tsx"
          "typescript"
          "yaml"
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
    };

    plugins.ts-autotag = {
      enable = true;
    };

    plugins.ts-context-commentstring = {
      enable = true;
    };
  };
}
