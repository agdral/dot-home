{pkgs, ...}: {
  imports = [
    ./tridactyl
    ./walker
    ./waybar
    ./firefox
    ./chromium
    ./swaync
    ./neovide
    ./proton
    # ./obsidian
  ];

  home.packages = with pkgs; [
    qalculate-gtk
    qbittorrent
    localsend
    thunderbird
    tidal-hifi
    wayvnc
    tigervnc
    pavucontrol
    tauon
    obsidian
  ];

  programs = {
    mpv.enable = true;
    ripgrep.enable = true;
    zathura.enable = true;
    imv.enable = true;
  };
}
