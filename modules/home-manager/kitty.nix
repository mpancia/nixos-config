{
  programs.kitty = {
    enable = true;
    font = {
      name = "FantasqueSansM Nerd Font Mono";
      size = 14;
    };
    shellIntegration.enableZshIntegration = true;
    theme = "Gruvbox Material Dark Hard";
    settings = {
      background_opacity = "0.85";
      confirm_os_window_close = 0;
      macos_option_as_alt = true; # Option key acts as Alt on macOS
      scrollback_lines = 10000;
      enable_audio_bell = false;
      tab_bar_edge = "top"; # tab bar on top
    };
  };
}
