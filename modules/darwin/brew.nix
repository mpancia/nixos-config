{
  homebrew = {
    enable = true;
    onActivation = { autoUpdate = true; cleanup = "zap"; upgrade = true; };
    casks = [
      "1password"
      "arc"
      "discord"
      "fig"
      "jellyfin-media-player"
      "karabiner-elements"
      "moonlight"
      "obsidian"
      "orbstack"
      "plex"
      "plexamp"
      "raycast"
      "slack"
      "steam"
      "tailscale"
      "zoom"
      "signal"
      "https://raw.githubusercontent.com/Homebrew/homebrew-cask/HEAD/Casks/g/google-chrome.rb"
      "surge-xt"
      "audiogridder-plugin"
      "bitwig-studio"
      "ableton-live-suite"
    ];
  };
}
