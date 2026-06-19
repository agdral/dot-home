{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotHome;
  asyar_pack = pkgs.callPackage ./_asyar.nix {};
  name = "asyar";
in {
  options.dotHome.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    home.packages = [
      asyar_pack
    ];
  };
}

