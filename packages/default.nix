{pkgs, ...}: {
  imports = [
    ./tridactyl
    ./walker
    ./waybar
    ./firefox
    ./swaync
    ./neovide
    ./proton
  ];
  home.packages = with pkgs; [
    # Gui & Tui
    qalculate-gtk
    obsidian
    asciinema

    # Only Internet
    qbittorrent
    localsend
    thunderbird
    tidal-hifi

    # Vnc
    wayvnc
    tigervnc

    # System
    xdg-utils

    # Sound & Video
    nicotine-plus
    pavucontrol
    pamixer
    tauon

    # Hyprland
    hyprshot
    grimblast
    hyprpicker
    hyprland-qtutils
  ];

  programs = {
    mpv.enable = true;
    ripgrep.enable = true;
    zathura.enable = true;
    chromium.enable = true;
    imv.enable = true;
  };
}
