{ pkgs, ... }:
let
  marketplace_extensions =
    (import (builtins.fetchGit {
      url = "https://github.com/nix-community/nix-vscode-extensions";
      ref = "refs/heads/master";
      rev = "c43d9089df96cf8aca157762ed0e2ddca9fcd71e";
    })).extensions."aarch64-darwin";
in
{
  home.stateVersion = "23.11";
  fonts.fontconfig.enable = true;

  # .Rprofile 
  home.file.".Rprofile".text = ''
    options("width"=160)                # wide display with multiple monitors
    options("digits.secs"=3)            # show sub-second time stamps
    r <- getOption("repos")             # hard code the US repo for CRAN
    r["CRAN"] <- "http://cran.us.r-project.org"
    options(repos = r)
    rm(r)
    ## from the AER book by Zeileis and Kleiber
    options(prompt="R> ", digits=4, show.signif.stars=FALSE)
    q <- function (save="no", ...) {
      quit(save=save, ...)
    }
    sshhh <- function(a.package){
      suppressWarnings(suppressPackageStartupMessages(
        library(a.package, character.only=TRUE)))
    }
    auto.loads <-c("dplyr", "ggplot2")
    if(interactive()){
      invisible(sapply(auto.loads, sshhh))
    }
  '';

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
    fzf = {
      enable = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    vim = {
      enable = true;
      defaultEditor = true;
    };
    vscode = {
      enable = true;
      mutableExtensionsDir = false;
      userSettings = {
        "diffEditor.experimental.useVersion2" = true;
        "editor.accessibilitySupport" = "off";
        "editor.fontFamily" = "FantasqueSansM Nerd Font Mono, Menlo, Monaco";
        "editor.formatOnPaste" = true;
        "editor.inlineSuggest.enabled" = true;
        "editor.minimap.autohide" = false;
        "nixEnvSelector.suggestion" = false;
        "r.bracketedPaste" = false;
        "r.rterm.mac" = "/run/current-system/sw/bin/radian";
        "vim.easymotion" = true;
        "vim.enableNeovim" = true;
        "vim.sneak" = true;
        "vim.sneakReplacesF" = true;
        "vim.statusBarColorControl" = false;
        "vim.useSystemClipboard" = false;
        "workbench.colorTheme" = "Gruvbox Material Dark";
        "workbench.startupEditor" = "none";
        "vsicons.dontShowNewVersionMessage" = true;
      };


      extensions = with pkgs.vscode-extensions; [
        arrterian.nix-env-selector
        bbenoist.nix
        codezombiech.gitignore
        eamodio.gitlens
        editorconfig.editorconfig
        esbenp.prettier-vscode
        github.copilot
        gruntfuggly.todo-tree
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        mikestead.dotenv
        ms-python.black-formatter
        ms-python.python
        ms-python.vscode-pylance
        vscodevim.vim
        yzhang.markdown-all-in-one
      ] ++ (
        with marketplace_extensions.vscode-marketplace; [
          donjayamanne.githistory
          dracula-theme.theme-dracula
          kamikillerto.vscode-colorize
          ms-toolsai.jupyter
          ms-vscode-remote.remote-containers
          oderwat.indent-rainbow
          rdebugger.r-debugger
          reditorsupport.r
          ritwickdey.liveserver
          sainnhe.gruvbox-material
          sourcery.sourcery
          visualstudioexptteam.vscodeintellicode
          vscode-icons-team.vscode-icons
          wayou.vscode-todo-highlight
        ]
      );
    };
    zsh = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
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
          "vscode"
        ];
        theme = "jonathan";
      };
    };
    kitty = {
      enable = true;
      font.name = "FantasqueSansM Nerd Font Mono";
      font.size = 14;
      shellIntegration.enableZshIntegration = true;
      theme = "Gruvbox Material Dark Hard";
      settings = {
        confirm_os_window_close = 0;
      };
    };
    bat = {
      enable = true;
      config = {
        theme = "gruvbox-dark";
      };
    };
    git = {
      delta.enable = true;
      delta.options = {
        navigate = true;
        side-by-side = true;
        line-number = true;
        theme = "gruvbox-dark";
      };
      userName = "msp";
      lfs = { enable = true; };
      userEmail = "msp@themsp.org";
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        rebase.autoStash = true;
      };
    };
  };
}
