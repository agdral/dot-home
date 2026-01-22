[
  {
    on = "\"";
    run = "plugin fzf";
    desc = "Jump to a file/directory via fzf";
  }
  {
    on = "'";
    run = "plugin zoxide";
    desc = "Jump to a directory via zoxide";
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
]
