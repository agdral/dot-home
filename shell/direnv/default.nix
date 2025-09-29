{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  config = mkIf cfg.direnv {
    programs = {
      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      fish = {
        interactiveShellInit = ''
          direnv hook fish | source
        '';
      };
    };
  };
}
