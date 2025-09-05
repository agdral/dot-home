{...}: let
  utils = import ../../utils.nix;
in {
  wayland.windowManager.hyprland.settings = {
    bind = utils.importNixList ./binds;
    windowrulev2 = utils.importNixList ./rules;
  };
}
