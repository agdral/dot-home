{...}: {
  programs.yazi.keymap.mgr.prepend_keymap = [
    {
      on = "Z";
      run = "plugin fzf";
      desc = "Jump to a file/directory via fzf";
    }
    {
      on = "z";
      run = "plugin zoxide";
      desc = "Jump to a directory via zoxide";
    }
    {
      on = ["<C-e>"];
      run = ''shell 'nohup neovide --wayland_app_id=neovide "$@" -- -c "cd $@" >/dev/null 2>&1 &' --confirm '';
    }

    {
      on = ["<C-o>"];
      run = ''shell 'neovide --wayland_app_id=Code "$@" -- -c "cd $@" >/dev/null 2>&1 &' --confirm '';
    }

    # Tab Switch
    {
      on = ["<D-g>"];
      run = "tab_switch -1 --relative";
      desc = "Switch to the previous tab";
    }
    {
      on = ["<D-h>"];
      run = "tab_switch 1 --relative";
      desc = "Switch to the next tab";
    }
    {
      on = ["e"];
      run = "seek 5";
    }
    {
      on = ["o"];
      run = "seek -5";
    }

    # Restore
    {
      on = ["u"];
      run = "plugin restore";
      desc = "Restore last deleted files/folders";
    }

    # Mount
    {
      on = "M";
      run = "plugin mount";
    }

    # Ouch Plugin

    {
      on = ["C"];
      run = "plugin ouch zip";
      desc = "Compress with ouch";
    }
  ];
}
