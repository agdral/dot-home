{pkgs, ...}: {
  home.packages = with pkgs; [
    swww
    (writeShellScriptBin "imageShuffle" (builtins.readFile ./dot/imageShuffle.sh))
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "imageShuffle $XDG_PICTURES_DIR/Wallpaper"
  ];
}
