{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  config = mkIf cfg.qmk {
    home.file = {
      ".config/qmk/qmk.ini".text = ''
        [user]
        qmk_home = ~/.qmk/qmk_firmware
      '';
    };

    home.packages = with pkgs; [
      qmk
    ];
  };
}
