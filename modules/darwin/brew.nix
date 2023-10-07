{
  homebrew = {
    enable = true;
    onActivation = { autoUpdate = true; cleanup = "zap"; upgrade = true; };
    taps = [
      "homebrew/cask-versions"
      "gcenx/wine"
    ];
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
      "gcenx/wine/wineskin"
      "plex"
      "wine-staging"
      "plexamp"
      "raycast"
      "slack"
      "steam"
      "audacity"
      "vlc"
      "tailscale"
      "zoom"
      "the-unarchiver"
      "signal"
      "surge-xt"
      "audiogridder-plugin"
      "bitwig-studio"
      "ableton-live-suite"
    ];
  };
}
