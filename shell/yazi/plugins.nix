{pkgs}: let
  epubP = pkgs.fetchFromGitHub {
    owner = "kirasok";
    repo = "epub-preview.yazi";
    rev = "main";
    hash = "sha256-wHTR8frrFL3cUD8fvSTO+m/77wQ7auVjTZ1uCTB/UzU=";
  };
  audioP = pkgs.fetchFromGitHub {
    owner = "Sonico98";
    repo = "exifaudio.yazi";
    rev = "master";
    hash = "sha256-RWCqWBpbmU3sh/A+LBJPXL/AY292blKb/zZXGvIA5/o=";
  };
  torrentP = pkgs.fetchFromGitHub {
    owner = "kirasok";
    repo = "torrent-preview.yazi";
    rev = "main";
    hash = "sha256-VhJvNRKHxVla4v2JJeSnP0MOMBFSm4k7gfqjrHOMVlo=";
  };
in {
  epub-preview = epubP;
  exifaudio = audioP;
  torrent-preview = torrentP;
  full-border = pkgs.yaziPlugins.full-border;
  mount = pkgs.yaziPlugins.mount;
  relative-motions = pkgs.yaziPlugins.relative-motions;
  restore = pkgs.yaziPlugins.restore;
  sudo = pkgs.yaziPlugins.sudo;
}
