{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotPack;
  name = "apps";
in {
  options.dotPack.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
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
