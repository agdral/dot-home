{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotShell;
  name = "tldr";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    services.tldr-update.enable = true;
    home.packages = [pkgs.tldr];
  };
}
