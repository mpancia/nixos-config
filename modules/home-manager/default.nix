{ pkgs, ... }:
{
  imports = [
    ./doom.nix
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./R.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
  ];
  home.stateVersion = "23.11";
  fonts.fontconfig.enable = true;

  # Packages
  home.packages = with pkgs;
    [
      dejavu_fonts
      powerline-fonts
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
          "FantasqueSansMono"
        ];
      })
    ];
  # Program config
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    vim = {
      enable = true;
      defaultEditor = true;
    };
    bat = {
      enable = true;
      config = {
        theme = "gruvbox-dark";
      };
    };
  };
}
