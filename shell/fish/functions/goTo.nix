{...}: {
  programs.fish.functions = {
    g-k530 = ''
      set edit_p "keymaps/default/keymap.c"
      handle_if $argv[1] $path_owngit"/k530" $edit_p
    '';
    g-k630 = ''
      set edit_p "keymaps/default/keymap.c"
      handle_if $argv[1] $path_owngit"/k630" $edit_p
    '';
    g-docker = ''
      handle_dir $argv[1] $path_docker
    '';
    g-nixvim = ''
      handle_dir $argv[1] $path_dot"/Nixvim-Config/" 
    '';
    g-nixos = ''
      cd $path_nixos
      sudo -E neovide -- -c "cd $path_nixos"
    '';
    g-home = ''
      handle_dir $argv[1] $path_dot"/Home-Default/"
    '';
    g-dot = ''
      handle_dir $argv[1] $path_dot"/Dotfile-Default/"
    '';
  };
}
