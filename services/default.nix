{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  moduleOption = [
    "hypridle"
    "musicWake"
    # "openTablet"
    "safeEyes"
    "wlsunset"
    "espanso"
    "swww"
    "syncthing"
    "hyprPolkit"
    "pyprland"
  ];
in {
  options = genAttrs moduleOption (name: mkEnableOption name);

  config = lib.mkMerge ([
      {
        services.copyq.enable = true;
        services.gnome-keyring.enable = true;
      }
    ]
    ++ map (name:
      lib.mkIf config.${name}.enable (
        (import ./${name}) {inherit config lib pkgs;}
      ))
    moduleOption);
}
