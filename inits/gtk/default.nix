{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotInits;
  name = "gtk";
in {
  options.dotInits.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      theme.name = "Adwaita";
      gtk3 = {
        extraConfig.gtk-application-prefer-dark-theme = true;
      };
    };
  };
}
