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
  programs.vscode = {
    enable = false;
    mutableExtensionsDir = true;
    userSettings = {
      "diffEditor.experimental.useVersion2" = true;
      "editor.accessibilitySupport" = "off";
      "editor.fontFamily" = "FantasqueSansM Nerd Font Mono, Menlo, Monaco";
      "editor.formatOnPaste" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.minimap.autohide" = false;
      "nixEnvSelector.suggestion" = false;
      "r.bracketedPaste" = false;
      "git.openRepositoryInParentFolders" = "always";
      "r.rterm.mac" = "/run/current-system/sw/bin/radian";
      "vim.easymotion" = true;
      "vim.enableNeovim" = true;
      "vim.sneak" = true;
      "vim.sneakReplacesF" = true;
      "vim.statusBarColorControl" = false;
      "vim.useSystemClipboard" = true;
      "vim.normalModeKeyBindingsNonRecursive" = [
        {
          "before" = [ "g" "D" ];
          "commands" = [ "editor.action.revealDefinitionAside" ];
        }
        {
          "before" = [ "<space>" ];
          "commands" = [ "vspacecode.space" ];
        }
        {
          "before" = [ "," ];
          "commands" = [
            "vspacecode.space"
            {
              "command" = "whichkey.triggerKey";
              "args" = "m";
            }
          ];
        }
      ];
      "vim.visualModeKeyBindingsNonRecursive" = [
        {
          "before" = [ "<space>" ];
          "commands" = [ "vspacecode.space" ];
        }
        {
          "before" = [ ";" ];
          "commands" = [
            "vspacecode.space"
            {
              "command" = "whichkey.triggerKey";
              "args" = "m";
            }
          ];
        }
        {
          "before" = [ ">" ];
          "commands" = [ "editor.action.indentLines" ];
        }
        {
          "before" = [ "<" ];
          "commands" = [ "editor.action.outdentLines" ];
        }
      ];
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
      ms-vscode-remote.remote-ssh
      jdinhlife.gruvbox
      yzhang.markdown-all-in-one
    ] ++ (
      with marketplace_extensions.vscode-marketplace; [
        # sourcery.sourcery
        # visualstudioexptteam.vscodeintellicode
        asvetliakov.vscode-neovim
        donjayamanne.githistory
        dracula-theme.theme-dracula
        jetpack-io.devbox
        kamikillerto.vscode-colorize
        marus25.cortex-debug
        mcu-debug.debug-tracker-vscode
        mcu-debug.memory-view
        mcu-debug.peripheral-viewer
        mcu-debug.rtos-views
        ms-azuretools.vscode-docker
        ms-toolsai.jupyter
        ms-vscode-remote.remote-containers
        ms-vscode.makefile-tools
        ms-vscode.vscode-typescript-next
        oderwat.indent-rainbow
        qingpeng.common-lisp
        rdebugger.r-debugger
        reditorsupport.r
        richie5um2.vscode-sort-json
        ritwickdey.liveserver
        usernamehw.errorlens
        vscode-icons-team.vscode-icons
        vspacecode.vspacecode
        vspacecode.whichkey
        wayou.vscode-todo-highlight
      ]
    );
  };
}
