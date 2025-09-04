{pkgs, ...}: let
  utils = import ../utils.nix;
  folderImports =
    utils.importFoldersExcept ./. [];
in {
  imports = folderImports;

  home.packages = with pkgs; [
    qalculate-gtk
    qbittorrent
    localsend
    thunderbird
    wayvnc
    tigervnc
    pavucontrol
    obsidian
  ];

  programs = {
    mpv.enable = true;
    ripgrep.enable = true;
    zathura.enable = true;
    imv.enable = true;
  };
}
