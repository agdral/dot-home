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
  };
}

