{...}: {
  wayland.windowManager.hyprland.settings = {
    "$Modm" = "SUPER";
    "$HyprLm" = "SUPER ALT";
    "$HyprRm" = "SUPER CONTROL";
    "$HyprOm" = "SUPER ALT CONTROL";

    "$ModS" = "SUPER SHIFT";
    "$HyprLS" = "SUPER ALT SHIFT";
    "$HyprRS" = "SUPER CONTROL SHIFT";
    "$HyprOS" = "SUPER ALT CONTROL";

    exec-once = [
      # Firefox
      "firefox -p argonarch"
      "imageShuffle ~/Apps/wallpaper"
    ];
  };
}
