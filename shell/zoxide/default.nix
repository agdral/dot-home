{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
  name = "zoxide";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    programs = {
      zoxide = {
        enable = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
      };
    };
  };
}
