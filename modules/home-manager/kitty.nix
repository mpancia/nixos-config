{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 12;
    };
    shellIntegration.enableZshIntegration = true;
    theme = "Rosé Pine";
    settings = {
      background_opacity = "0.85";
      confirm_os_window_close = 0;
      macos_option_as_alt = true; # Option key acts as Alt on macOS
      scrollback_lines = 10000;
      enable_audio_bell = false;
      tab_bar_edge = "top"; # tab bar on top
      alt_send_esc = false;
    };
    extraConfig = ''
      font_features MonoLisa +zero +ss04 +ss07 +ss08 +ss09
      font_features MonoLisaItalic +zero +ss04 +ss07 +ss08 +ss09
    '';
  };
  xdg.configFile.kitty = {
      source = ./dotfiles/kitty;
      recursive = true;
  };
}
