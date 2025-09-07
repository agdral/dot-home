{utils,...}: let
  files = utils.importNixList ./workers;
in {
  imports = files;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };
}

