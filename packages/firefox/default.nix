{pkgs, ...}: let
  contenidos = builtins.map builtins.readFile [
    ./dot/autohide_navigation_button.css
    ./dot/tridactyl.css
  ];
  styles = builtins.concatStringsSep "\n" contenidos;
in {
  home.file = {
    ".config/tridactyl/tridactylrc".source = ./dot/tridactylrc;
  };
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [pkgs.tridactyl-native];
    languagePacks = [
      "es-ES"
    ];
    policies = {
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      ShowHomeButton = false;
    };
    profiles = {
      argonarch = {
        isDefault = true;
        id = 0;
        settings = import ./settings.nix;
        # extensions = import ./extensions.nix;
        userChrome = styles;
        search.default = "bing";
      };

      secundary = {
        isDefault = false;
        id = 1;
        settings = import ./settings.nix;
        # extensions = import ./extensions.nix;
        userChrome = styles;
        search = {
          default = "bing";
          force = true;
        };
      };
    };
  };
}
