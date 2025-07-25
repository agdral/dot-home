{...}: {
  programs.fish.functions = {
    g-k530 = ''
      set edit_p "keymaps/default/keymap.c"
      handle_if $argv[1] $path_proy"/OwnGithub/k530" $edit_p
    '';
    g-k630 = ''
      set edit_p "keymaps/default/keymap.c"
      handle_if $argv[1] $path_proy"/OwnGithub/k630" $edit_p
    '';
    g-github = ''
      handle_dir $argv[1] $path_proy"/Github"
    '';
    g-jupiter = ''
      handle_dir $argv[1] $path_proy"/Jupyter"
    '';
    g-owngit = ''
      handle_dir $argv[1] $path_proy"/OwnGithub"
    '';
    g-practica = ''
      handle_dir $argv[1] $path_proy"/Practicas"
    '';
    g-serios = ''
      handle_dir $argv[1] $path_proy"/Serios"
    '';
    g-docker = ''
      handle_dir $argv[1] $path_docker
    '';
  };
}
