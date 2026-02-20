{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  options.dotShell.payRespect = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf cfg.payRespect {
    programs.pay-respects = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
