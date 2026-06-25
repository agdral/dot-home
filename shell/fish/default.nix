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
  name = "fish";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
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
