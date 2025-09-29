{
  config,
  lib,
  tools,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  config = mkIf cfg.fish {
    imports = tools.importNixFiles ./functions [];
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting
      '';
    };
  };
}
