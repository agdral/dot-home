{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  config = mkIf cfg.apps {
    home.packages = with pkgs; [
      fdupes
      playerctl
      pamixer
      pavucontrol
    ];
    programs = {
      mpv.enable = true;
      zathura.enable = true;
      imv.enable = true;
    };
  };
}
