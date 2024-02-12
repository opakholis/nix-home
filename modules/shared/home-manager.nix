{ pkgs, ... }:
{

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.bat.enable
  bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "catppuccin-frappe";
    };
    themes = let
      cp = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
        rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
        sha256 = "1g2r6j33f4zys853i1c5gnwcdbwb6xv5w6pazfdslxf69904lrg9";
      };
    in {
      catppuccin-latte.src = "${cp}/Catppuccin-latte.tmTheme";
      catppuccin-frappe.src = "${cp}/Catppuccin-frappe.tmTheme";
      catppuccin-macchiato.src = "${cp}/Catppuccin-macchiato.tmTheme";
      catppuccin-mocha.src = "${cp}/Catppuccin-mocha.tmTheme";
    };
  };

  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.tmux.enable
  tmux = {
    enable = true;
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
      # https://github.com/Misterio77/nix-colors
      #
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

}
