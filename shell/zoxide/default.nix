{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  options.dotShell.zoxide = mkEnableOption "zoxide";
  config = mkIf cfg.zoxide {
    programs = {
      zoxide = {
        enable = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
      };
    };
  };
}
