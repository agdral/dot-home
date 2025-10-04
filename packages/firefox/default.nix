{
  pkgs,
  config,
  lib,
  firefox-addons,
  ...
}:
with lib; let
  cfg = config.dotPack;
  contenidos = builtins.map builtins.readFile [
    ./dot/autohide_navigation_button.css
    ./dot/tridactyl.css
  ];
  styles = builtins.concatStringsSep "\n" contenidos;
in {
  config = mkIf cfg.firefox {
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
          extensions.packages = with firefox-addons.packages.${pkgs.system}; [
            ublock-origin
            darkreader
            tridactyl
            proton-pass
            proton-vpn
            sponsorblock
            don-t-fuck-with-paste
            bonjourr-startpage
          ];
          userChrome = styles;
          search = {
            default = "bing";
            force = true;
          };
        };

        secundary = {
          isDefault = false;
          id = 1;
          settings = import ./settings.nix;
          extensions.packages = with firefox-addons.packages.${pkgs.system}; [
            ublock-origin
            darkreader
            bonjourr-startpage
          ];
          userChrome = styles;
          search = {
            default = "bing";
            force = true;
          };
        };
      };
    };
  };
}
