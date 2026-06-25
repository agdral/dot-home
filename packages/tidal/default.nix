{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  tidalDlNg = pkgs.python3Packages.callPackage ./tidal-ng.nix {};
  settingsPath = "${config.home.homeDirectory}/.config/tidal_dl_ng-dev/settings.json";
  name = "tidal";
in {
  options.dotPack.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    home.packages = [
      pkgs.tidal-hifi
      tidalDlNg
    ];

    home.activation.tidalSettings = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if [ ! -f "${settingsPath}" ]; then
        $DRY_RUN_CMD mkdir -p "$(dirname "${settingsPath}")"
        $DRY_RUN_CMD cp ${./dot/settings.json} "${settingsPath}"
        $DRY_RUN_CMD chmod u+w "${settingsPath}"
      fi
    '';
  };
}
