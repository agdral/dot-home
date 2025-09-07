{
  tools,
  pkgs,
  ...
}: {
  imports = tools.importFoldersExcept ./. [];

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
