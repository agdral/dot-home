{config, ...}: let
  style_css = [
    "${config.home.sessionVariables.path_dotfiles}/firex/userChrome.css"
    "${config.home.sessionVariables.path_dotfiles}/firex/autohide_navigation_button.css"
    "${config.home.sessionVariables.path_dotfiles}/firex/autohide_toolbox.css"
    "${config.home.sessionVariables.path_dotfiles}/firex/sideberyMods.css"
  ];
  contenidos = builtins.map builtins.readFile style_css;
  styles = builtins.concatStringsSep "\n" contenidos;
in {
  programs.firefox.profiles.secundary = {
    isDefault = false;
    id = 1;
    settings = {
      "browser.sessionstore.resume_from_crash" = false;
      "mousewheel.with_control.action" = 0;
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
    userChrome = styles;
  };
}
