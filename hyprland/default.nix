{pkgs,...}: {
  imports = [
    ./general/config.nix
    ./general/exec.nix
    ./general/app.nix
    ./general/workSpecial.nix
    ./general/windowConfig.nix

    ./tools/pyprland.nix
    ./tools/hyprPolkit.nix
  ];
  home.packages = with pkgs; [
    hyprshot
    grimblast
    hyprpicker
    hyprland-qtutils
  ];
}
