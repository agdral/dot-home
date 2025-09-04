{...}: let
  utils = import ../../utils.nix;
in {
  wayland.windowManager.hyprland.settings = {
    bind = utils.importNixList ./binds;
    exec-once = utils.importNixList ./exec;
    windowrulev2 = utils.importNixList ./rules;
  };
}
