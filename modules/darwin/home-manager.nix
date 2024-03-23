{pkgs, ...}: let
  user = "opakholis";
in {
  # Explicitly set the username and home directory.
  # https://daiderd.com/nix-darwin/manual/index.html#opt-users.users._name_.home
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    shell = pkgs.zsh;
  };

  # Enable homebrew
  # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.enable
  homebrew = {
    # Even so, we need to install homebrew manually
    # https://brew.sh/
    enable = true;

    # List of Homebrew casks to install.
    # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.casks
    casks = [
      # browers
      "arc"
      "firefox"

      # development
      "iterm2"
      "orbstack"
      "openvpn-connect"
      "reactotron"
      "visual-studio-code"
      "zulu11"

      # communication
      "zoom"

      # productivity
      "calibre"
      "obsidian"
      "raycast"

      # utilities
      "cleanshot"
      "iina"
      "lunar"
      "keka"
    ];

    # Apps to install from the Mac App Store.
    # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.masApps
    masApps = {
      Xcode = 497799835;
    };
  };

  # Enable home-manager
  # https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-nix-darwin-module
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = {pkgs, ...}: {
      home = {
        packages = pkgs.callPackage ./packages.nix {};

        # Extra $PATH which isn't managed by Home Manager.
        # https://nix-community.github.io/home-manager/options.xhtml#opt-home.sessionPath
        sessionPath = [
          "$HOME/.local/bin"
        ];

        # Should not change this value, even if you update Home Manager.
        # If you do want to update the value, then make sure to first
        # check the Home Manager release notes.
        stateVersion = "23.05";
      };

      programs = {} // import ../shared/home-manager.nix {inherit pkgs;};
    };
  };
}
