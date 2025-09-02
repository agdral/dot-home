{
  pkgs,
  ...
}: let
  utils = import ../utils.nix;
  fileImports =
    utils.importNixFiles ./. [
      "default.nix"
    ];
in {
  imports = fileImports;

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
