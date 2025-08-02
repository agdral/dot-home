{pkgs, ...}: {
  programs.yazi.plugins = {
    full-border = pkgs.yaziPlugins.full-border;
  };
  imports = [
    ./epub-preview.nix
    ./exifaudio.nix
    ./torrent-preview.nix
    ./mount.nix
    ./epub-preview.nix
    ./sudo.nix
    ./restore.nix
    ./relative-motions.nix
  ];
}
