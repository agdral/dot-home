{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotInits;
  name = "qt";
in {
  options.dotInits.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
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
