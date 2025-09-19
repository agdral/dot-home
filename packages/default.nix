{
  pkgs,
  tools,
  ...
}: {
  imports = tools.importFoldersExcept ./. [];

  home.packages = with pkgs; [
    fdupes
    pulseaudio
    playerctl
    pamixer
    pavucontrol
  ];
  programs = {
    mpv.enable = true;
    ripgrep.enable = true;
    zathura.enable = true;
    imv.enable = true;
  };
}
