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
    imv
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
  ];

  programs = {
    mpv.enable = true;
    ripgrep.enable = true;
    zathura.enable = true;
  };

  services = {
    copyq = {
      enable = true;
    };
    gnome-keyring.enable = true;
  };
}
