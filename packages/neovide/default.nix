{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  config = mkIf cfg.neovide {
    programs.neovide = {
      enable = true;
      settings = {
        fork = true;
      };
    };
  };
}
