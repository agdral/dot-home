{...}: let
  utils = import ../../utils.nix;
  bind = utils.importNixList ./binds;
  exec-once = utils.importNixList ./exec;
  windowrulev2 = utils.importNixList ./rules;
in {
  wayland.windowManager.hyprland.settings = {
    inherit
      bind
      exec-once
      windowrulev2
      ;
  };
}

