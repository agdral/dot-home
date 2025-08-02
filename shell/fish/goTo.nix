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
    g-docker = ''
      handle_dir $argv[1] $path_docker
    '';
    g-home = ''
      handle_dir $argv[1] $path_home
    '';
    g-dhome = ''
      handle_dir $argv[1] $path_home"/Home-Default/"
    '';
    g-nixos = ''
      handle_dir $argv[1] $path_nixos
    '';
    g-dnixos = ''
      handle_dir $argv[1] $path_owngit"/Dotfile-Default/"
    '';
    g-nixvim = ''
      handle_dir $argv[1] $path_owngit"/Nixvim-Config/" 
    '';
  };
}
