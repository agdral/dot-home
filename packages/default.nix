{pkgs, ...}: let
  utils = import ../utils.nix;
  folderImports =
    utils.importFoldersExcept ./. [
    ];
in {
  imports = folderImports;

  home.packages = with pkgs; [
    qalculate-gtk
    qbittorrent
    localsend
    thunderbird
    tidal-hifi
    wayvnc
    tigervnc
    pavucontrol
    obsidian
    tauon
  ];

  programs = {
    mpv.enable = true;
    ripgrep.enable = true;
    zathura.enable = true;
    imv.enable = true;
  };
}
