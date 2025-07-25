{...}: {
  programs.fish = {
    enable = true; 
    interactiveShellInit = ''
      set -g fish_greeting
      direnv hook fish | source
      atuin init fish | source
      bind up _atuin_bind_up

      set path_docker "/hdd/kael/Documentos/Docker"
      set path_nixos "/etc/nixos"
      set path_config "$HOME/.config"
      set path_proy "/hdd/falcon/Proyectos"
      set path_home "$HOME/.config/home-manager"
    '';
  };

  imports = [
    ./function.nix

    ./aliases/nixos.nix
    ./aliases/nushell.nix
    ./aliases/short.nix

    ./functions/develop.nix
    ./functions/docker.nix
    ./functions/nvim.nix

    ./goTo/home.nix
    ./goTo/nixos.nix
    ./goTo/packs.nix
  ];
}
