{...}: {
  programs.fish.functions = {
    uh = ''
      cd "$note_home"
      nn -- -c "cd $note_home" -c "Neorg workspace home" -c "Neorg index"    
    '';

    uth = ''
      cd "$note_home"
      nn -- -c "cd $note_home" -c "Neorg workspace home" -c 'Neorg journal today'
    '';

    uw = ''
      cd "$note_work"
      nn -- -c "cd $note_work" -c "Neorg workspace work" -c "Neorg index"
    '';

    utw = ''
      cd "$note_work"
      nn -- -c "cd $note_work" -c "Neorg workspace work" -c 'Neorg journal today'
    '';
  };
}
