{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  options.dotPack.neovide = mkEnableOption "neovide";
  config = mkIf cfg.neovide {
    programs.neovide = {
      enable = true;
      settings = {
        fork = true;
      };
    };
  };
}
