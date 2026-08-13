{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
  name = "starship";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      presets = [
        "jetpack"
      ];
      settings = {
        format = "[$username]";
        right_format = "[$all]";
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
