{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  options.dotPack.dconf = mkEnableOption "dconf";
  config = mkIf cfg.dconf {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "Adwaita";
        icon-theme = "Papirus-Dark";
        document-font-name = "Noto Sans 10";
        font-name = "Noto Sans 10";
        monospace-font-name = "Noto Sans Mono 10";
        cursor-theme = "oreo_spark_blue_cursors";
        color-scheme = "prefer-dark";
      };
    };
  };
}
