{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotHome;
  zenBrowser_pack = pkgs.callPackage ./_zenBrowser.nix {};
  name = "zenBrowser";
in {
  options.dotHome.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    environment.systemPackages = [
      zenBrowser_pack
    ];
  };
}

