{...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    package = null;
    portalPackage = null;
  };
  imports = [
    ./settings
    ./services
    ./packages
    ./simples
    ./workSpecials
  ];
}
