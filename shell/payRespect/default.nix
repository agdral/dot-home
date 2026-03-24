{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  options.dotShell.payRespect = mkEnableOption "payRespect";
  config = mkIf cfg.payRespect {
    programs.pay-respects = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
