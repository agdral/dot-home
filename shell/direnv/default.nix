{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
  name = "direnv";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    programs = {
      direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
      };
    };
  };
}
