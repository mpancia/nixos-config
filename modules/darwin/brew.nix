{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    taps = [ "homebrew/cask-versions" "gcenx/wine" ];
    brews = [ "opus" "openjdk@11"];
    casks = [
      "1password"
      "ableton-live-suite"
      "arc"
      "audacity"
      "audiogridder-plugin"
      "bitwig-studio"
      "calibre"
      "discord"
      "fig"
      "firefox"
      "gcenx/wine/wineskin"
      "google-chrome"
      "jellyfin-media-player"
      "karabiner-elements"
      "moonlight"
      "nextcloud"
      "obsidian"
      "orbstack"
      "plex"
      "plexamp"
      "raycast"
      "signal"
      "slack"
      "steam"
      "surge-xt"
      "syncthing"
      "amethyst"
      "tailscale"
      "the-unarchiver"
      "visual-studio-code"
      "vlc"
      "warp"
      "wine-staging"
      "zoom"
    ];
  };
}
