let
  style_css = [
    ./dot/autohide_navigation_button.css
    ./dot/tridactyl.css
  ];
  contenidos = builtins.map builtins.readFile style_css;
  styles = builtins.concatStringsSep "\n" contenidos;
  settings_default = {
    "browser.sessionstore.resume_from_crash" = false;
    "mousewheel.with_control.action" = 0;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    "dom.forms.autocomplete.formautofill" = false;
    "signon.autofillForms" = false;
    "sidebar.verticalTabs" = true;
    "sidebar.revamp" = true;
    "sidebar.main.tools" = "aichat,syncedtabs,history,bookmarks";
    "sidebar.expandOnHover" = true;
    "sidebar.expandOnHoverMessage.dismissed" = true;
    "sidebar.backupState" = ''{"command":"","launcherExpanded":false,"launcherVisible":false}'';
    "sidebar.old-sidebar.has-used" = true;
    "sidebar.new-sidebar.has-used" = true;
    "sidebar.visibility" = "expand-on-hover";
  };
in {
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
    profiles = {
      argonarch = {
        isDefault = true;
        id = 0;
        settings = settings_default;
        userChrome = styles;
      };

      secundary = {
        isDefault = false;
        id = 1;
        settings = settings_default;
        userChrome = styles;
      };
    };
  };
}
