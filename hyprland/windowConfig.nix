{...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Hypr Fly
      "monitor HDMI-A-1,class:(Hypr Fly)"
      "noborder,class:(Hypr Fly)"
      "rounding 0,class:(Hypr Fly)"
      "noblur, class:(Hypr Fly)"
      "noanim, class:(Hypr Fly)"
      "float, class:(Hypr Fly)"
      "size 100% 100%, class:(Hypr Fly)"
      "center, class:(Hypr Fly)"

      # SafeEyes-0
      "monitor DP-1, title:(SafeEyes-0)"
      "workspace special:safe-0, title:(SafeEyes-0)"
      "noborder, title:(SafeEyes-0)"
      "rounding 0, title:(SafeEyes-0)"
      "noblur, title:(SafeEyes-0)"
      "float, title:(SafeEyes-0)"
      "size 100% 100%, title:(SafeEyes-0)"
      "center, title:(SafeEyes-0)"

      # SafeEyes-1
      "monitor HDMI-A-1, title:(SafeEyes-1)"
      "workspace special:safe-1, title:(SafeEyes-1)"
      "noborder, title:(SafeEyes-1)"
      "rounding 0, title:(SafeEyes-1)"
      "noblur, title:(SafeEyes-1)"
      "float, title:(SafeEyes-1)"
      "size 100% 100%, title:(SafeEyes-1)"
      "center, title:(SafeEyes-1)"
    ];
  };
}
