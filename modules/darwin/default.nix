{ pkgs, user, ... }:
let
my-python-packages = ps:
with ps; [
    pandas
    debugpy
    virtualenv
    black
    requests
    ipython
    jupyterlab
    pyparsing
    pylsp-rope
    pylsp-mypy
    python-lsp-server
    python-lsp-ruff
];
R-with-my-packages = { pkgs, ... }:
pkgs.radianWrapper.override {
    wrapR = true;
    packages = with pkgs.rPackages; [
        tidyverse
            languageserver
            httpgd
            blogdown
            rprofile
    ];
};
in {
    imports = [ ./brew.nix ];
    programs.zsh.enable = true;
    users.users.${user}.home = "/Users/${user}";

    services = {
        lorri.enable = true;
        nix-daemon.enable = true;
        emacs.enable = true;
    };

    environment = {
        loginShell = "${pkgs.zsh}/bin/zsh -l";
        variables.SHELL = "${pkgs.zsh}/bin/zsh";
        variables.LANG = "en_US.UTF-8";
        systemPackages = [
            (R-with-my-packages { inherit pkgs; })
                (pkgs.python311.withPackages my-python-packages)
                pkgs."_1password"
                pkgs.act
                pkgs.musikcube
                pkgs.lazygit
                pkgs.nurl
                pkgs.aspell
                pkgs.cmus
                pkgs.cmusfm
                pkgs.audible-cli
                pkgs.awscli
                pkgs.ctags
                pkgs.curl
                pkgs.rename
                pkgs.renameutils
                pkgs.devbox
                pkgs.dfu-util
                pkgs.djvu2pdf
                pkgs.entr
                pkgs.eza
                pkgs.fd
                pkgs.ffmpeg
                pkgs.gcc-arm-embedded
                pkgs.gh
                pkgs.gorilla-cli
                pkgs.helix
                pkgs.jq
                pkgs.lua
                pkgs.lua-language-server
                pkgs.marksman
                pkgs.mc
                pkgs.mosh
                pkgs.nil
                pkgs.nixfmt
                pkgs.nixpkgs-fmt
                pkgs.nodePackages.prettier
                pkgs.ranger
                pkgs.nodePackages.pyright
                pkgs.nushellFull
                pkgs.openai
                pkgs.openocd
                pkgs.pandoc
                pkgs.poetry
                pkgs.pyenv
                pkgs.ripgrep
                pkgs.ruff-lsp
                pkgs.rustup
                pkgs.shellcheck
                pkgs.silicon
                pkgs.taskwarrior
                pkgs.taskwarrior-tui
                pkgs.texlive.combined.scheme-full
                pkgs.timewarrior
                pkgs.tree-sitter
                pkgs.wget
                pkgs.yt-dlp
                pkgs.zoxide
                ];
    };

    nix.settings.experimental-features = "nix-command flakes";

    system = {
        stateVersion = 4;
        activationScripts.postUserActivation.text = ''
# Following line should allow us to avoid a logout/login cycle
            /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
            '';
        defaults = {
            NSGlobalDomain = {
                AppleKeyboardUIMode = 3;
                ApplePressAndHoldEnabled = false;
                InitialKeyRepeat = 25;
                KeyRepeat = 6;
                NSAutomaticCapitalizationEnabled = false;
                NSAutomaticDashSubstitutionEnabled = false;
                NSAutomaticPeriodSubstitutionEnabled = false;
                NSAutomaticQuoteSubstitutionEnabled = false;
                NSAutomaticSpellingCorrectionEnabled = false;
                NSNavPanelExpandedStateForSaveMode = true;
                NSNavPanelExpandedStateForSaveMode2 = true;
                _HIHideMenuBar = false;
            };

            dock = {
                mru-spaces = false;
                orientation = "left";
                showhidden = true;
                autohide = false;
                tilesize = 28;
                launchanim = false;
                show-process-indicators = true;
            };

            finder = {
                AppleShowAllExtensions = true;
                QuitMenuItem = true;
                FXEnableExtensionChangeWarning = false;
# Breadcrumbss
                ShowPathbar = true;
# When performing a search, search the current folder by default
                FXDefaultSearchScope = "SCcf";
# Default view list 
                FXPreferredViewStyle = "Nlsv";
            };

            trackpad = {
                Clicking = true;
                TrackpadThreeFingerDrag = true;
            };

            CustomUserPreferences = {
                "com.apple.finder" = {
                    ShowExternalHardDrivesOnDesktop = true;
                    ShowHardDrivesOnDesktop = true;
                    ShowMountedServersOnDesktop = true;
                    ShowRemovableMediaOnDesktop = true;
                    _FXSortFoldersFirst = true;
                };
                "com.apple.mail" = {
# Disable inline attachments (just show the icons)
                    DisableInlineAttachmentViewing = true;
                };
                "com.apple.Safari" = {
# Privacy: don’t send search queries to Apple
                    UniversalSearchEnabled = false;
                    SuppressSearchSuggestions = true;
# Press Tab to highlight each item on a web page
                    WebKitTabToLinksPreferenceKey = true;
                    ShowFullURLInSmartSearchField = true;
# Prevent Safari from opening ‘safe’ files automatically after downloading
                    AutoOpenSafeDownloads = false;
                    ShowFavoritesBar = false;
                    IncludeInternalDebugMenu = true;
                    IncludeDevelopMenu = true;
                    WebKitDeveloperExtrasEnabledPreferenceKey = true;
                    WebContinuousSpellCheckingEnabled = true;
                    WebAutomaticSpellingCorrectionEnabled = false;
                    AutoFillFromAddressBook = false;
                    AutoFillCreditCardData = false;
                    AutoFillMiscellaneousForms = false;
                    WarnAboutFraudulentWebsites = true;
                    WebKitJavaEnabled = false;
                    WebKitJavaScriptCanOpenWindowsAutomatically = false;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks" =
                        true;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" =
                        true;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled" =
                        false;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled" =
                        false;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles" =
                        false;
                    "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically" =
                        false;
                };
                "com.apple.AdLib" = { allowApplePersonalizedAdvertising = false; };
                "com.apple.SoftwareUpdate" = {
                    AutomaticCheckEnabled = true;
# Check for software updates daily, not just once per week
                    ScheduleFrequency = 1;
# Download newly available updates in background
                    AutomaticDownload = 1;
# Install System data files & security updates
                    CriticalUpdateInstall = 1;
                };
                "com.apple.screencapture" = {
                    location = "~/Desktop";
                    type = "png";
                };
                "com.apple.desktopservices" = {
# Avoid creating .DS_Store files on network or USB volumes
                    DSDontWriteNetworkStores = true;
                    DSDontWriteUSBStores = true;
                };
            };
        };

        keyboard.enableKeyMapping = true;
        keyboard.remapCapsLockToControl = true;
    };

    security.pam.enableSudoTouchIdAuth = true;

    nixpkgs = {
        hostPlatform = "aarch64-darwin";
        config.allowUnfree = true;
    };
}
