{ ... }: {

  # Enable homebrew support
  # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.enable
  homebrew = {
    # Even so, we need to install homebrew manually
    # https://brew.sh/
    enable = true;

    # List of Homebrew casks to install.
    # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.casks
    casks = [
      "iina"
      "keka"
      "zoom"
    ];

    # Apps to install from the Mac App Store.
    # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.masApps
    masApps = {
      Xcode = 497799835;
    };
  };
}
