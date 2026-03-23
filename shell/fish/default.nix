{
  joinix,
  lib,
  config,
  ...
}:
with lib; let
  functionsF = lib.attrsets.mergeAttrsList (map import (joinix.importNixFiles ./functions []));
  abbrsF = lib.attrsets.mergeAttrsList (map import (joinix.importNixFiles ./abbrs []));
  cfg = config.dotShell;
in {
  options.dotShell.fish = mkOption {
    type = types.bool;
    default = false;
  };
  config = lib.mkIf cfg.fish {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting
      '';
      functions = functionsF;
      shellAbbrs = abbrsF;
    };
  };
}
