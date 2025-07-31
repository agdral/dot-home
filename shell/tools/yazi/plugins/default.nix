{pkgs, ...}: {
  programs.yazi.plugins = {
    restore = pkgs.yaziPlugins.restore;
    full-border = pkgs.yaziPlugins.full-border;
  };
  imports = [
    ./epub-preview.nix
    ./exifaudio.nix
    ./torrent-preview.nix
    ./mount.nix
    ./epub-preview.nix
    ./sudo.nix
    ./relative-motions.nix
  ];
}
