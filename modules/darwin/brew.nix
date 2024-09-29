{ ... }:
{
  # Enable homebrew
  # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.enable
  homebrew = {
    # Even so, we need to install homebrew manually
    # https://brew.sh/
    enable = true;

    # Automatically use the Brewfile that this module generates in the Nix store
    # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.global.brewfile
    global.brewfile = true;

    # List of Homebrew formula repositories to tap.
    # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.taps
    taps = [
      "buo/cask-upgrade"
    ];

    # List of Homebrew formulae to install.
    # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.brews
    brews = [ "bitwarden-cli" ];

    # List of Homebrew casks to install.
    # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.casks
    casks = [
      # browers
      "arc"
      "zen-browser"

      # development
      "iterm2"
      "orbstack"
      "openvpn-connect"
      "reactotron"
      "visual-studio-code"

      # communication
      "zoom"

      # productivity
      "calibre"
      "obsidian"
      "raycast"

      # utilities
      "cleanshot"
      "iina"
      "keka"
      "monitorcontrol"
    ];

    # Apps to install from the Mac App Store.
    # https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.masApps
    # See product identifier: `mas list`
    masApps = {
      Xcode = 497799835;
      TestFlight = 899247664;
    };
  };
}
