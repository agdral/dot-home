{pkgs}: let
  epubP = pkgs.fetchFromGitHub {
    owner = "kirasok";
    repo = "epub-preview.yazi";
    rev = "8d894dba0588da4dd54561b975730320723c2d28";
    hash = "sha256-QP92Uk7hDkZduwRSMNXMOygCUeBlXrL7JnKdK1wIRsQ=";
  };
  audioP = pkgs.fetchFromGitHub {
    owner = "Sonico98";
    repo = "exifaudio.yazi";
    rev = "4506f9d5032e714c0689be09d566dd877b9d464e";
    hash = "sha256-RWCqWBpbmU3sh/A+LBJPXL/AY292blKb/zZXGvIA5/o=";
  };
  torrentP = pkgs.fetchFromGitHub {
    owner = "kirasok";
    repo = "torrent-preview.yazi";
    rev = "d745df633a4a52f9621eeab46e74a54e8c056a56";
    hash = "sha256-nC8mIGB4wQftDMRXKprvF4SThNdvueCLQ8REiPs8HUY=";
  };

  relativeP = pkgs.fetchFromGitHub {
    owner = "Jormala";
    repo = "relative-motions.yazi";
    rev = "d4f2003b90a6129847e17107df76ba43091c7755";
    hash = "sha256-lyzwbs1u4qXuIamE31QAD6e22RPJxROs7Q/tuTkz12Q=";
  };
in {
  epub-preview = epubP;
  exifaudio = audioP;
  torrent-preview = torrentP;
  relative-motions = relativeP;
  full-border = pkgs.yaziPlugins.full-border;
  mount = pkgs.yaziPlugins.mount;
  restore = pkgs.yaziPlugins.restore;
  sudo = pkgs.yaziPlugins.sudo;
}
