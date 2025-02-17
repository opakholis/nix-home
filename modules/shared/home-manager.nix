{ pkgs, ... }:
let
  w0 = {
    name = "Opa Kholis Majid";
    email = "code@opakholis.space";
    signingKey = "B029ED5DC8722086";
  };
in
{
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.bat.enable
  bat = {
    enable = true;
    config = {
      pager = "less -FR";
      style = "snip";
      theme = "catppuccin-frappe";
    };
    themes =
      let
        cp = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "1g2r6j33f4zys853i1c5gnwcdbwb6xv5w6pazfdslxf69904lrg9";
        };
      in
      {
        catppuccin-latte.src = "${cp}/Catppuccin-latte.tmTheme";
        catppuccin-frappe.src = "${cp}/Catppuccin-frappe.tmTheme";
        catppuccin-macchiato.src = "${cp}/Catppuccin-macchiato.tmTheme";
        catppuccin-mocha.src = "${cp}/Catppuccin-mocha.tmTheme";
      };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.direnv.enable
  direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.git.enable
  git = {
    enable = true;
    lfs.enable = true;
    userName = w0.name;
    userEmail = w0.email;
    signing = {
      key = w0.signingKey;
      signByDefault = true;
    };
    ignores = [
      "*~"
      "*.swp"
      ".DS_Store"
    ];
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.lazygit.enable
  lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        activeBorderColor = [
          "#babbf1"
          "bold"
        ];
        inactiveBorderColor = [ "#a5adce" ];
        optionsTextColor = [ "#8caaee" ];
        selectedLineBgColor = [ "#414559" ];
        cherryPickedCommitBgColor = [ "#51576d" ];
        cherryPickedCommitFgColor = [ "#babbf1" ];
        unstagedChangesColor = [ "#c6d0f5" ];
        defaultFgColor = [ "#c6d0f5" ];
        searchingActiveBorderColor = [ "#e5c890" ];
      };
    };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.tmux.enable
  tmux = {
    enable = true;
    package = pkgs.stable.tmux;
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    prefix = "C-Space";
    plugins = with pkgs.stable.tmuxPlugins; [
      sensible
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-pane-contents-area 'visible'
        '';
      }
    ];
    extraConfig = ''
      # Catppucin colorscheme
      cp_base="#303446"
      cp_surface="#414559"
      cp_overlay="#737994"
      cp_text="#c6d0f5"
      cp_mauve="#ca9ee6"
      cp_lavender="#babbf1"

      set -g message-style "fg=$cp_lavender"
      set -g message-command-style "fg=$cp_text"

      set -g pane-border-style "fg=$cp_surface"
      set -g pane-active-border-style "fg=$cp_surface"

      setw -g window-status-current-format "\
      #[fg=$cp_base,bg=$cp_mauve] #{b:pane_current_path} •\
      #[fg=$cp_base,bg=$cp_mauve] #W \
      #[fg=$cp_mauve,bg=$cp_base] \
      "
      setw -g window-status-format "\
      #[fg=$cp_base,bg=$cp_overlay] #I \
      #[fg=$cp_text,bg=$cp_surface] #W \
      #[bg=$cp_base] \
      "

      setw -g clock-mode-colour "$cp_mauve"
      setw -g mode-style "fg=$cp_mauve bg=$cp_overlay bold"

      set -g status-left ""
      set -g status-right ""

      # Essential settings
      #
      # Statusbar
      set -g status-bg "$cp_base"
      set -g status-justify "centre"
      set -g status-position "bottom"

      # Terminal type configuration
      set -g default-terminal "xterm-ghostty"
      set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'

      # Undercurl support
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

      # Copy mode like vi ways
      bind -T copy-mode-vi 'v' send -X begin-selection
      bind -T copy-mode-vi 'V' send -X select-line
      bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'pbcopy'

      # Allow mouse in certain conditions
      bind -n WheelDownPane select-pane -t= \; send-keys -M
      bind -n C-WheelUpPane select-pane -t= \; copy-mode -e \; send-keys -M
      bind -T copy-mode-vi C-WheelUpPane send-keys -X halfpage-up
      bind -T copy-mode-vi C-WheelDownPane send-keys -X halfpage-down

      # Open new pane in current directory
      bind v split-window -hc "#{pane_current_path}"
      bind s split-window -vc "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Switch panes
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Choose-Tree
      bind e choose-tree -swZ
    '';
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.fzf.enable
  fzf = {
    enable = true;
    defaultOptions = [
      "--border"
      "--color=border:#c6d0f5"
      "--color=bg+:#414559,bg:#303446"
      "--color=fg:#c6d0f5,fg+:#c6d0f5"
      "--color=hl:#e78284,hl+:#e78284"
      "--color=header:#e78284,pointer:#f2d5cf,spinner:#f2d5cf"
      "--color=marker:#f2d5cf,prompt:#ca9ee6,info:#ca9ee6"
    ];
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.yt-dlp.enable
  yt-dlp = {
    enable = true;
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zsh.enable
  zsh = {
    enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
        "pattern"
      ];
    };
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    defaultKeymap = "viins";
    initExtra = ''
      # Fix brew path
      if [ -f "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi

      # Default editor
      export EDITOR='nvim'
      export VISUAL='nvim'

      # Android development
      if [ -d "$HOME/Library/Android/sdk" ]; then
        export ANDROID_HOME="$HOME/Library/Android/sdk"
        export PATH="$PATH:$ANDROID_HOME/emulator"
        export PATH="$PATH:$ANDROID_HOME/platform-tools"
        export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
      fi

      # iOS development
      if [ -s "$HOME/.cargo/env" ]; then
        source "$HOME/.cargo/env"
      fi

      if [ -d "$HOME/.rvm" ]; then
        export PATH="$PATH:$HOME/.rvm/bin"
      fi

      # Spotify
      if [ -f "$HOME/.spicetify/spicetify" ]; then
        export PATH="$PATH:$HOME/.spicetify/"
      fi

      # Use nvim as manpager `:h Man`
      export MANPAGER='nvim +Man!'
      export MANWIDTH=999

      # Do menu-driven completion
      zstyle ':completion:*' menu select

      # More tweaks
      # see: man zshoptions
      setopt auto_cd interactive_comments
    '';
    sessionVariables = {
      # Override history search highlight
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND = "fg=magenta";
      HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND = "";
      # Override vi-mode highlight
      ZVM_VI_HIGHLIGHT_BACKGROUND = "black";
      # Pure prompt
      PURE_PROMPT_SYMBOL = "›";
      PURE_PROMPT_VICMD_SYMBOL = "›";
    };
    plugins = [
      {
        name = "pure-prompt";
        file = "share/zsh/site-functions/async";
        src = pkgs.pure-prompt;
      }
      {
        name = "pure-prompt";
        file = "share/zsh/site-functions/prompt_pure_setup";
        src = pkgs.pure-prompt;
      }
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
    shellAliases = {
      # Common
      c = "clear";
      q = "exit";
      cd = "zoxide";
      cat = "bat";
      gg = "lazygit";
      l = "eza --icons -alh";
      ls = "eza --icons";
      # git
      g = "git";
      ga = "git add";
      gc = "git commit";
      gl = "git pull";
      gp = "git push";
      glo = "git pull origin";
      gpo = "git push origin";
      gst = "git status";
      gco = "git checkout";
      gcb = "git checkout -b";
      gcl = "git clone";
      # rabbit navigation
      ".." = "./..";
      "..." = "./../..";
      "...." = "./../../..";
    };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zoxide.enable
  zoxide = {
    enable = true;
  };
}
