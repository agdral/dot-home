{tools, ...}:{
  wayland.windowManager.hyprland.settings = {
    bind = tools.importNixList ./binds;
    windowrulev2 = tools.importNixList ./rules;
  };
}
