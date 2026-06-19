{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotHome;
  padloc_pack = pkgs.callPackage ./_padloc.nix {};
  name = "padloc";
in {
  options.dotHome.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    environment.systemPackages = [
      padloc_pack
    ];
  };
}

