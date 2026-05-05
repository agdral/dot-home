{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  options.dotPack.qt = mkEnableOption "qt";
  config = mkIf cfg.qt {
    qt = {
      enable = true;
      platformTheme.name = "adwaita";
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
    };
  };
}
