{...}: {
  wayland.windowManager.hyprland.settings = {
    "$Modm" = "SUPER";
    "$HyprLm" = "SUPER CONTROL";
    "$HyprRm" = "SUPER ALT";
    "$HyprOm" = "SUPER ALT CONTROL";

    "$ModS" = "SUPER SHIFT";

    exec-once = [
      # Firefox
      "[workspace 1 silent] firefox -p argonarch"
      "imageShuffle ~/Apps/wallpaper"
    ];
  };
}
