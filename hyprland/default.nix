{...}: {
  wayland.windowManager.hyprland.enable = true;
  imports = [
    ./settings
    ./services
    ./packages
    ./simples
  ];
}
