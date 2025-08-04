{...}: {
  programs.fish.functions = {
    handle_if = ''
      if test "$argv[1]" = c
          cd "$argv[2]"
          nc -- -c "cd $argv[2]" -c "edit $argv[3]"
      else if test "$argv[1]" = n
          cd "$argv[2]"
          nvim -c "cd $argv[2]" -c "edit $argv[3]"
      else
          cd "$argv[1]"
          nv -- -c "cd $argv[1]" -c "edit $argv[2]"
      end
    '';

    handle_dir = ''
      if test "$argv[1]" = c
          cd "$argv[2]"
          nc -- -c "cd $argv[2]" 
      else if test "$argv[1]" = n
          cd "$argv[2]"
          nvim -c "cd $argv[2]" 
      else
          cd "$argv[1]"
          nv -- -c "cd $argv[1]" -c "Neotree" 
      end
    '';

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
      handle_dir $argv[1] $path_nixos
    '';
    gd-home = ''
      handle_dir $argv[1] $path_dot"/Home-Default/"
    '';
    gd-nixos = ''
      handle_dir $argv[1] $path_dot"/Dotfile-Default/"
    '';
  };
}
