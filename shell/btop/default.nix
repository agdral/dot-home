{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
  name = "btop";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "Default";
        theme_background = false;
        proc_tree = true;
      };
    };
  };
}
