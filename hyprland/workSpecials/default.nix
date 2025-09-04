{...}: let
  utils = import ../../utils.nix;
  special = utils.importNixList ./workers;

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
