{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotHome;
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

    home.packages = with pkgs; [
      qmk
      dos2unix
    ];
  };
}
