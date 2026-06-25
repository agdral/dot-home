{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
  name = "opencode";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    programs.opencode = {
      enable = true;
      themes = {
        catBlue = ./theme.json;
      };
      tui.theme = "catBlue";
    };
  };
}
