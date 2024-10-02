{ ... }:
{
  programs.nixvim = {
    diagnostics = {
      virtual_text = false;
      float = {
        focusable = true;
        style = "minimal";
        border = "rounded";
        source = "always";
        header = "";
        prefix = "";
        suffix = "";
      };
    };

    opts = {
      # Show line numbers
      number = true;

      # Show relative line numbers
      relativenumber = true;

      # Use the system clipboard
      clipboard = "unnamedplus";

      # Enable mouse support
      mouse = "a";

      # Don't show the mode, since it's already in the status line
      showmode = false;

      # Number of spaces that represent a <TAB>
      tabstop = 2;
      softtabstop = 2;

      # Use spaces instead of tabs
      expandtab = true;

      # Enable smart indentation
      smartindent = true;

      # Number of spaces to use for each step of (auto)indent
      shiftwidth = 2;

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or one or more capital letters in the search term
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Show which line your cursor is on
      cursorline = true;

      # Enable 24-bit RGB color in the TUI
      termguicolors = true;

      # Minimal number of screen lines to keep above and below the cursor.
      scrolloff = 10;

      # Get rid of the annoying filler characters
      fillchars = {
        fold = " ";
        eob = " "; # suppress ~ at EndOfBuffer
        diff = "╱"; # options = ⣿ ░ ─ ╱
        foldopen = "▾";
        foldsep = "│";
        foldclose = "▸";
      };

      # Better completion experience
      # Max items in the completion menu
      completeopt = [
        "menu"
        "menuone"
        "noinsert"
      ];
      pumheight = 15;
    };
  };
}
