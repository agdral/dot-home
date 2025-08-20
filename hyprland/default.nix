{pkgs, ...}: {
  imports = [
    ./interfaces.nix
    ./config.nix
    ./exec.nix
    ./app.nix
    ./workSpecial.nix
    ./windowConfig.nix
  ];

  home.packages = with pkgs; [
    hyprshot
    grimblast
    hyprpicker
    hyprland-qtutils
  ];
}
