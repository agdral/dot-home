{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  options.dotShell.starship = mkEnableOption "starship";
  config = mkIf cfg.starship {
    programs.starship = {
      enable = true;
      settings = {
        username = {
          style_user = "white bold";
          style_root = "black bold";
          format = "[$user]($style)  ";
          disabled = false;
          show_always = true;
        };
      };
    };
  };
}
