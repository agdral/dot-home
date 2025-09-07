{utils, ...}:{
  wayland.windowManager.hyprland.settings = {
    bind = utils.importNixList ./binds;
    windowrulev2 = utils.importNixList ./rules;
  };
}
