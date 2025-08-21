{pkgs, ...}: {
  imports = [
    ./general/config.nix
    ./general/variables.nix
    ./general/workSpecial.nix

    ./binds/fnKeys.nix
    ./binds/general.nix
    ./binds/media.nix
    ./binds/mouse.nix
    ./binds/numbers.nix
    ./binds/windows.nix

    ./rules/hyprFly.nix
    ./rules/safeEyes.nix
  ];

  home.packages = with pkgs; [
    hyprshot
    grimblast
    hyprpicker
    hyprland-qtutils
  ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1 silent] firefox -p argonarch"
      "imageShuffle /hdd/kael/Graficos/Wallpaper"
    ];
  };
}
