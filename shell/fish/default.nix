{tools, ...}: {
  imports = tools.importNixList ./functions;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };
}
