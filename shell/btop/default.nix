{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  options.dotShell.btop = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf cfg.btop {
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
