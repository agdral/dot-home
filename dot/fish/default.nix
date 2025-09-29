{tools, ...}: {
  imports = tools.importNixFiles ./functions [];
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };
}
