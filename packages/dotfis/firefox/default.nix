{...}: {
  programs.firefox = {
    enable = true;
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
  };
  imports = [
    ./argonarch.nix
    ./secundary.nix
  ];
}
# SearchEngines
# ExtensionSettings
