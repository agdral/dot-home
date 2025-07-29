{
  pkgs,
  ...
}: {
  programs.firefox.nativeMessagingHosts = [pkgs.tridactyl-native];
  home.file = {
    ".config/tridactyl/tridactylrc".source = ./dot/tridactylrc;
  };
}
