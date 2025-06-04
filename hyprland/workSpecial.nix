{...}: let
  # Función utilitaria para convertir un attrset a una lista de strings
  mapToList = f: attrs: builtins.attrValues (builtins.mapAttrs f attrs);
  pagesWebs = [
    "https://web.whatsapp.com"
    "https://gemini.google.com"
    "https://chatgpt.com"
    "https://keep.google.com/u/0/"
    "https://docs.google.com/spreadsheets/u/0/"
  ];

  firefoxPages = builtins.concatStringsSep " " pagesWebs;

  special = {
    U = {
      name = "webs";
      app = "firefox -p secundary --name secundary ${firefoxPages}";
      class = "secundary";
    };
    O = {
      name = "terminal";
      app = "kitty --class=initial";
      class = "initial";
    };
    E = {
      name = "terminal_2";
      app = "kitty --class=initial_2";
      class = "initial_2";
    };
    A = {
      name = "file";
      app = "foot -a fileTerm yazi";
      class = "fileTerm";
    };
    I = {
      name = "musicTerm";
      app = "tauon";
      class = "tauonmb";
    };
    Escape = {
      name = "mail";
      app = "thunderbird";
      class = "thunderbird";
    };
    X = {
      name = "music";
      app = "tidal-hifi";
      class = "tidal-hifi";
    };
    Delete = {
      name = "calendar";
      app = "proton-mail";
      class = "Proton Mail";
    };
    semicolon = {
      name = "task";
      app = "proton-pass";
      class = "Proton Pass";
    };
    Q = {
      name = "code";
      class = "Code";
      silent = false;
      group = true;
    };
    J = {
      name = "neovide";
      class = "neovide";
      silent = false;
      group = true;
    };
    K = {
      name = "noto";
      app = "obsidian";
      class = "obsidian";
    };
  };

  # Generación de bindings
  bind =
    mapToList (key: val: "$Modm, ${key}, togglespecialworkspace, ${val.name}") special
    ++ mapToList (key: val: "$HyprLm, ${key}, movetoworkspacesilent, ${val.name}") special
    ++ builtins.filter (x: x != null)
    (mapToList (key: val:
      if val ? app
      then "$HyprRm, ${key}, exec, ${val.app}"
      else null)
    special)
    ++ builtins.filter (x: x != null)
    (mapToList (key: val:
      if val ? special
      then "$HyprOm, ${key}, exec, ${val.special}"
      else null)
    special);

  # Comandos para ejecutar una sola vez
  exec-once =
    builtins.filter (x: x != null)
    (mapToList (
        _: val:
          if val ? app
          then val.app
          else null
      )
      special);
  # Reglas de ventanas para ubicar por clase en su workspace especial
  windowrulev2 =
    mapToList (_: val: "noanim,class:(${val.class})") special
    ++ builtins.filter (x: x != null)
    (mapToList (
        _: val:
          if val ? silent && val.silent == false
          then "workspace special:${val.name}, class:(${val.class})"
          else "workspace special:${val.name} silent, class:(${val.class})"
      )
      special)
    ++ builtins.filter (x: x != null)
    (mapToList (
        _: val:
          if val ? group && val.group == true
          then "group set,class:(${val.class})"
          else null
      )
      special);
in {
  wayland.windowManager.hyprland.settings = {
    inherit
      bind
      exec-once
      windowrulev2
      ;
  };
}
