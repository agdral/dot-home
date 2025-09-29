{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  config = mkIf cfg.payRespect {
    programs.pay-respects = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
