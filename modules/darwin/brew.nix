{
  homebrew = {
    enable = true;
    onActivation = { autoUpdate = true; cleanup = "zap"; upgrade = true; };
    brews = [
      "opus"
    ];
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
      "surge-xt"
      "audiogridder-plugin"
      "bitwig-studio"
      "ableton-live-suite"
    ];
  };
}
