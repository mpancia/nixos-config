{
  programs.git = {
    enable = true;
    lfs = { enable = true; };
    userEmail = "msp@themsp.org";
    userName = "msp";
    delta.enable = true;
    delta.options = {
      navigate = true;
      side-by-side = true;
      line-number = true;
      theme = "gruvbox-dark";
    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase.autoStash = true;
    };
  };
}
