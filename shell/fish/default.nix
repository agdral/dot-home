{...}: {
  programs.fish = {
    enable = true; 
    interactiveShellInit = ''
      set -g fish_greeting

      set path_docker "/hdd/kael/Documentos/Docker"
      set path_owngit "/hdd/falcon/Proyectos/OwnGithub"
      set path_dot "/hdd/falcon/Proyectos/Dotfiles"
      set path_nixos "/etc/nixos"
    '';
  };

  imports = [
    ./aliases/nixos.nix
    ./aliases/nushell.nix
    ./aliases/short.nix
    ./aliases/cloud.nix

    ./functions/neovide.nix
    ./functions/develop.nix
    ./functions/docker.nix
    ./functions/nvim.nix
    ./functions/goTo.nix
  ];
}
