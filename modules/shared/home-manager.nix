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

  # TODO: use nix-colors
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

    plugins = with pkgs.tmuxPlugins; [
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
      # TODO: use nix-colors
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

  # TODO: use nix-colors
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

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zsh.enable
  zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    initExtraFirst = ''
      # Fix brew path
      if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    '';
    initExtra = ''
      # Do menu-driven completion
      zstyle ':completion:*' menu select

      # Bind up and down arrow keys to search history
      autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey "^[[A" up-line-or-beginning-search
      bindkey "^[[B" down-line-or-beginning-search

      # More tweaks
      # see: man zshoptions
      setopt auto_cd interactive_comments

      # Create aliases for packages if they exist
      create_alias() {
        local pkg_name=$1
        local alias_name=$2

        if command -v "$pkg_name" > /dev/null 2>&1; then
          alias "$alias_name"="$pkg_name"
        fi
      }

      # <pkg_name> <alias_name>
      create_alias zoxide cd
      create_alias eza ls
      create_alias bat cat
      create_alias lazygit gg
    '';
    initExtraBeforeCompInit = ''
      # Typewritten theme
      TYPEWRITTEN_SYMBOL="▲"
      TYPEWRITTEN_DISABLE_RETURN_CODE=true
    '';
    plugins = [
      {
        name = "typewritten";
        src = builtins.fetchGit {
          url = "https://github.com/reobin/typewritten";
          rev = "6f78ec20f1a3a5b996716d904ed8c7daf9b76a2a";
        };
      }
      {
        name = "zsh-autopair";
        src = builtins.fetchGit {
          url = "https://github.com/hlissner/zsh-autopair";
          rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
        };
      }
      {
        name = "zsh-vi-mode";
        file = "zsh-vi-mode.plugin.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/jeffreytse/zsh-vi-mode";
          rev = "ea1f58ab9b1f3eac50e2cde3e3bc612049ef683b";
        };
      }
    ];
    shellAliases = {
      # Enable aliases to be sudo’ed
      sudo = "sudo ";

      # Common
      c = "clear";
      q = "exit";

      # rabbit navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

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
    };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zoxide.enable
  zoxide = {
    enable = true;
  };
}
