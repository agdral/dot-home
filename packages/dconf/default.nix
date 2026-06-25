{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  name = "dconf";
in {
  options.dotPack.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
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
