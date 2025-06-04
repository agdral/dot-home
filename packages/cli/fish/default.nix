{...}: {
  programs.fish = {
    enable = true; 
    interactiveShellInit = ''
      set -g fish_greeting
      direnv hook fish | source
      atuin init fish | source
      bind up _atuin_bind_up

      set path_docker "$HOME/Apps/Docker"
      set path_nixos "/etc/nixos"
      set path_config "$HOME/.config"
      set path_home "$HOME/.config/home-manager"
      set note_home "/hdd/kael/Notes/Home"
      set note_work "/hdd/kael/Notes/Work"
    '';
  };

  imports = [
    ./functions
    ./function.nix
    ./aliases
  ];
}
