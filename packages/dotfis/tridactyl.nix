{
  pkgs,
  config,
  ...
}: {
  programs.firefox.nativeMessagingHosts = [pkgs.tridactyl-native];
  home.file = {
    ".config/tridactyl/tridactylrc".source = "${config.home.sessionVariables.path_dotfiles}/tridactyl/tridactylrc";
  };
}
