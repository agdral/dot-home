{pkgs, ...}: let
  tidalDlNg = pkgs.python3Packages.callPackage ./tidal-ng.nix {};
in {
  home.packages = [
    pkgs.tidal-hifi
    tidalDlNg
  ];

  home.file = {
    ".config/tidal-hifi/config.json".source = ./dot/config.json;
  };
}
