{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    unzip
    poppler
    ffmpegthumbnailer
    jq
    imagemagick
    exiftool
    mediainfo
    ouch
    transmission_4
    epub-thumbnailer
    p7zip
  ];
  programs = {
    yazi.enable = true;
  };

  home.file = {
    ".config/yazi/init.lua".source = ./dot/init.lua;
  };

  imports = [
    ./settings.nix
    ./theme.nix
    ./keymaps.nix
    ./plugins
  ];
}
