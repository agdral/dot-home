{...}: {
  programs.fish = {
    enable = true; 
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };

  imports = [
    ./functions/develop.nix
    ./functions/docker.nix
    ./functions/editor.nix
    ./functions/shell.nix
    ./functions/nvim.nix
    ./functions/git.nix
  ];
}
