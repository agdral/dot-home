{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  options.dotServ.apps = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf cfg.apps {
    home.packages = with pkgs; [
      fdupes
      playerctl
      pamixer
      pavucontrol
      dupeguru
    ];
    programs = {
      mpv.enable = true;
      zathura.enable = true;
      imv.enable = true;
    };
  };
}
