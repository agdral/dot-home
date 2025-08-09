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
  ];

  home.packages = with pkgs; [
    qalculate-gtk
    obsidian
    qbittorrent
    localsend
    thunderbird
    tidal-hifi
    wayvnc
    tigervnc
    nicotine-plus
    pavucontrol
    tauon
  ];

  programs = {
    mpv.enable = true;
    ripgrep.enable = true;
    zathura.enable = true;
    imv.enable = true;
  };
}
