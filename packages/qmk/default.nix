{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  options.dotPack.qmk = mkOption {
    type = types.bool;
    default = false;
  };
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
