{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  # tidalDlNg = pkgs.python3Packages.callPackage ./tidal-ng.nix {};
in {
  config = mkIf cfg.tidal {
    home.packages = [
      pkgs.tidal-hifi
      # tidalDlNg
    ];

    # home.file = {
    #   ".config/tidal-hifi/config.json".source = ./dot/config.json;
    # };
  };
}
