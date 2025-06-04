{...}: {
  programs.yazi.keymap.manager.prepend_keymap = [
    # Path Shortcuts
    {
      on = ["g" "p"];
      run = "cd /hdd/falcon/Proyectos";
      desc = "Goto Proyectos";
    }
    {
      on = ["g" "s"];
      run = "cd /hdd/falcon/Proyectos/Serios/";
      desc = "Goto Proyectos Serios";
    }
    {
      on = ["g" "o"];
      run = "cd /hdd/falcon/Proyectos/OwnGithub/";
      desc = "Goto Proyectos OwnGithub";
    }
    {
      on = ["g" "t"];
      run = "cd /hdd/falcon/Proyectos/GitHub/";
      desc = "Goto Proyectos GitHub";
    }
    {
      on = ["g" "d"];
      run = "cd /hdd/kael/Descargas";
      desc = "Goto Descargas";
    }
    {
      on = ["g" "e"];
      run = "cd /hdd/falcon/argonarch/Share/";
      desc = "Goto Share";
    }
    {
      on = ["g" "l"];
      run = "cd /hdd/falcon/argonarch/.local/share";
      desc = "Goto Local Share";
    }
  ];
}
