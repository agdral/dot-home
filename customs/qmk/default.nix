{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotHome;
  custom_pack = pkgs.callPackage ./package.nix {};
  name = "qmk";
in {
  options.dotHome.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    home.file = {
      ".config/qmk/qmk.ini".text = ''
        [user]
        qmk_home = ~/.qmk/qmk_firmware
      '';
    };

    home.packages = [
      custom_pack
    ];
  };
}
