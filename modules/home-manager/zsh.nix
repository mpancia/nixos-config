{ pkgs, ... }: {
  programs.zsh = {
    enable = true; # default shell on catalina
    enableCompletion = true;
    enableAutosuggestions = true;
    shellAliases = {
      ll = "exa -alh";
      update = "darwin-rebuild switch --flake ~/.nixpkgs";
      nixcfg = "code ~/.nixpkgs";
      cat = "bat";
      ls = "exa --hyperlink";
      tree = "exa --tree";
      cd = "z";
    };
    initExtraBeforeCompInit = ''
      # p10k instant prompt
      P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-''${(%):-%n}.zsh"
      [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
    '';
    initExtra = ''
      eval "$(pyenv init --path)"
      eval "$(pyenv init -)"
      eval "$(/opt/homebrew/bin/brew shellenv)"
      eval "$(pyenv virtualenv-init -)"
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./dotfiles/p10k-config;
        file = "p10k.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "1password"
        "aws"
        "docker"
        "dotenv"
        "fzf"
        "gh"
        "git"
        "git-lfs"
        "github"
        "python"
        "ssh-agent"
        "vi-mode"
        "vscode"
      ];
    };
  };
}
