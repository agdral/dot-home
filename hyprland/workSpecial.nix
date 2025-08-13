{...}: let
  pagesWebs = [
    "https://web.whatsapp.com"
    "https://chat.deepseek.com"
    "https://drive.google.com/drive/u/0/home"
    "https://mail.proton.me"
  ];

  firefoxPages = builtins.concatStringsSep " " pagesWebs;

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
      app = "kitty --class=fileTerm yazi";
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
      key = "Q";
      name = "task";
      app = "proton-pass";
      class = "Proton Pass";
    }
    {
      key = "J";
      name = "editorL";
      class = "Code";
      silent = false;
      group = true;
    }
    {
      key = "X";
      name = "editorR";
      class = "neovide";
      silent = false;
      group = true;
    }
    {
      key = "K";
      name = "noto";
      class = "obsidian";
      app = ''obsidian'';
    }
    {
      key = "minus";
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
