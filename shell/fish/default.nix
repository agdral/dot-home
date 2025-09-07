{tools, ...}: {
  imports = tools.importNixList ./workers;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };
}
