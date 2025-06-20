{...}: let
  pagesWebs = [
    "https://web.whatsapp.com"
    "https://chatgpt.com"
    "https://gemini.google.com"
  ];

  pagesGoogle = [
    "https://drive.google.com/drive/u/0/home"
    "https://keep.google.com/u/0/"
    "https://calendar.google.com/calendar/u/0/"
    "https://tasks.google.com/tasks/"
  ];

  firefoxPages = builtins.concatStringsSep " " pagesWebs;
  firefoxGoogle = builtins.concatStringsSep " " pagesGoogle;

  special = [
    # First Line
    {
      key = "Escape";
      name = "mail";
      app = "thunderbird";
      class = "thunderbird";
    }
    {
      key = "A";
      name = "file";
      app = "foot -a fileTerm yazi";
      class = "fileTerm";
    }
    {
      key = "O";
      name = "terminal";
      app = "kitty --class=initial";
      class = "initial";
    }
    {
      key = "E";
      name = "terminal_2";
      app = "kitty --class=initial_2";
      class = "initial_2";
    }
    {
      key = "U";
      name = "webs";
      app = "firefox -p secundary --name secundary ${firefoxPages}";
      class = "secundary";
    }
    {
      key = "I";
      name = "musicTerm";
      app = "tauon";
      class = "tauonmb";
    }

    # Second Line
    {
      key = "Delete";
      name = "noto";
      class = "noto";
      app = ''neovide --fork --wayland_app_id=noto "/hdd/kael/Notes/Home/index.norg" -- -c "cd /hdd/kael/Notes/Home" '';
      group = true;
    }
    {
      key = "Q";
      name = "task";
      app = "proton-pass";
      class = "Proton Pass";
    }
    {
      key = "J";
      name = "code";
      class = "Code";
      silent = false;
      group = true;
    }
    {
      key = "X";
      name = "neovide";
      class = "neovide";
      silent = false;
      group = true;
    }
    {
      key = "K";
      name = "googler";
      app = "firefox -p googler --name googler ${firefoxGoogle}";
      class = "googler";
    }
    {
      key = "bracketleft";
      name = "music";
      app = "tidal-hifi";
      class = "tidal-hifi";
    }
  ];

  bind =
    map (item: "$Modm, ${item.key}, togglespecialworkspace, ${item.name}") special
    ++ map (item: "$HyprLm, ${item.key}, movetoworkspacesilent, special:${item.name}") special
    ++ builtins.concatMap (
      item:
        if item ? app
        then ["$HyprRm, ${item.key}, exec, ${item.app}"]
        else []
    )
    special;

  exec-once =
    builtins.concatMap (
      item:
        if item ? app
        then [item.app]
        else []
    )
    special;

  windowrulev2 =
    map (item: "noanim,class:(${item.class})") special
    ++ builtins.concatMap (
      item:
        if item ? silent && item.silent == false
        then ["workspace special:${item.name}, class:(${item.class})"]
        else ["workspace special:${item.name} silent, class:(${item.class})"]
    )
    special
    ++ builtins.concatMap (
      item:
        if item ? group && item.group == true
        then ["group set,class:(${item.class})"]
        else []
    )
    special;
in {
  wayland.windowManager.hyprland.settings = {
    inherit
      bind
      exec-once
      windowrulev2
      ;
  };
}
