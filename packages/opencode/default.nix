{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  name = "opencode";
in {
  options.dotPack.${name} = mkEnableOption "${name}";
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
