{...}: {
  programs.fish = {
    enable = true; 
    interactiveShellInit = ''
      set -g fish_greeting
      direnv hook fish | source
      atuin init fish | source
      bind up _atuin_bind_up

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

    ./functions/develop.nix
    ./functions/docker.nix
    ./functions/nvim.nix
    ./functions/goTo.nix
  ];
}
