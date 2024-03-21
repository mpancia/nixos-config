{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    taps = [ "homebrew/cask-versions" "gcenx/wine" ];
    brews = [ "opus" "openjdk@11" "pyenv-virtualenv"];
    casks = [
      "1password"
      "basictex"
      "amethyst"
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
      "obs"
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
