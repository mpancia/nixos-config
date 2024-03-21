{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f";
    defaultOptions = ["--preview 'bat --color=always {}'"];
  };
}
