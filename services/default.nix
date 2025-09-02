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
    "openTablet"
    "safeEyes"
    "wlsunset"
    "espanso"
    "swww"
    "syncthing"
    "hyprPolkit"
    "pyprland"
  ];
in {
  services = {
    copyq.enable = true;
    gnome-keyring.enable = true;
  };

  options = genAttrs moduleOption (name: mkEnableOption name);

  config = mkMerge (map (
      name:
        mkIf config.${name}.enable (
          (import ./${name}) {inherit config lib pkgs;}
        )
    )
    moduleOption);
}
