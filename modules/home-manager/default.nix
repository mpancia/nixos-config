{ pkgs, ... }:
{
  imports = [
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./R.nix
    ./nvim.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
  ];
  home.stateVersion = "23.11";
  fonts.fontconfig.enable = true;

  home.packages = with pkgs;
    [
      dejavu_fonts
      powerline-fonts
      nodePackages.typescript
      nodejs # nixpkgs provides a "nodejs" package that corresponds to the current LTS version of nodejs, but you can specify a version (i.e node_20) if necessary
      yarn
      nodePackages.typescript-language-server
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
          "FantasqueSansMono"
          "JetBrainsMono"
          "Monofur"
        ];
      })
    ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
    bat = {
      enable = true;
      config = {
        theme = "gruvbox-dark";
      };
    };
  };
}
