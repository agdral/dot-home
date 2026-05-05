{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  options.dotPack.gtk = mkEnableOption "gtk";
  config = mkIf cfg.gtk {
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
