{
  tools,
  lib,
  ...
}: let
  functionsF = lib.attrsets.mergeAttrsList (tools.importNixFiles ./functions []);
  abbrsF = lib.attrsets.mergeAttrsList (tools.importNixFiles ./abbrs []);
in {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';
    functions = functionsF;
    shellAbbrs = abbrsF;
  };
}
