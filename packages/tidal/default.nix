{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  tidalDlNg = pkgs.python3Packages.callPackage ./tidal-ng.nix {};
in {
  config = mkIf cfg.tidal {
    home.packages = [
      pkgs.tidal-hifi
      tidalDlNg
    ];

    home.file = {
      ".config/tidal_dl_ng-dev/settings.json".source =
        config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/dotfiles/tidal/settings.json";
    };
  };
}
