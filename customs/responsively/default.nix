{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotHome;
  responsively_pack = pkgs.callPackage ./_responsively.nix {};
  name = "responsively";
in {
  options.dotHome.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    home.packages = [
      responsively_pack
    ];
  };
}
