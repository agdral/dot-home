{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotHome;
  custom_pack = pkgs.callPackage ./package.nix {};
  name = "responsively";
in {
  options.dotHome.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    home.packages = [
      custom_pack
    ];
  };
}
