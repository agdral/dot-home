{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
in {
  options.dotServ.neovide = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf cfg.neovide {
    programs.neovide = {
      enable = true;
      settings = {
        fork = true;
      };
    };
  };
}
