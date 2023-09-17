{ user, ... }: {
  enable = true;
  entries = [
    { path = "/Applications/Arc.app"; }
    { path = "/System/Applications/Messages.app/"; }
    { path = "/System/Applications/Facetime.app/"; }
    { path = "/Applications/Discord.app/"; }
    { path = "/Applications/Slack.app/"; }
    { path = "/System/Applications/Mail.app/"; }
    { path = "/System/Applications/Calendar.app/"; }
    { path = "/System/Applications/Music.app/"; }
    { path = "/Applications/Jellyfin Media Player.app/"; }
    { path = "/Applications/Plex.app"; }
    { path = "/Applications/Plexamp.app"; }
    { path = "/System/Applications/Photos.app/"; }
    { path = "/System/Applications/Home.app/"; }
    { path = "/Users/${user}/Applications/Home Manager Apps/Visual Studio Code.app"; }
    { path = "/Users/${user}/Applications/Home Manager Apps/kitty.app"; }
    { path = "/Applications/Obsidian.app/"; }
    { path = "/Applications/1Password.app/"; }
    {
      path = "";
      options = "--type small-spacer --section apps --after Calendar";
    }
    {
      path = "";
      options = "--type small-spacer --section apps --after Plexamp";
    }
    {
      path = "";
      options = "--type small-spacer --section apps --after Arc";
    }
    {
      path = "";
      options = "--type small-spacer --section apps --after Discord";
    }
    {
      path = "";
      options = "--type small-spacer --section apps --after Home";
    }
    # Folders:
    {
      path = "/Users/${user}/Downloads/";
      section = "others";
      options = "--sort dateadded --view list --display stack";
    }
    {
      path = "/Users/${user}/coding/";
      section = "others";
      options = "--sort dateadded --view grid --display folder";
    }
  ];
}