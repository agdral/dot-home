{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    unzip
    ripgrep
    poppler
    ffmpegthumbnailer
    fd
    jq
    fzf
    imagemagick
    exiftool
    mediainfo
    ouch
    glow
    transmission_4
    epub-thumbnailer
    p7zip
  ];
  programs.yazi = {
    enable = true;
  };

  home.file = {
    ".config/yazi/init.lua".source = "${config.home.sessionVariables.path_dotfiles}/yazi/init.lua";
  };

  imports = [
    ./settings.nix
    ./theme.nix
    ./keymaps
  ];
}
