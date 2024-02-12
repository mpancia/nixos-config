{ pkgs, ... }: {
  imports = [
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./R.nix
    ./ssh.nix
    ./vscode.nix
    ./zsh.nix
    ./nvim.nix
    ./tmux.nix
  ];
  home.stateVersion = "23.11";
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    dejavu_fonts
    powerline-fonts
    nodePackages.typescript
    nodePackages.vscode-langservers-extracted
    nodejs
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
      config = { theme = "gruvbox-dark"; };
    };
    zoxide = { enable = true; };
  };
}
