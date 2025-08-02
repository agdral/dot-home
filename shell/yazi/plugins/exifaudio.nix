{pkgs, ...}: let
  repo = pkgs.fetchFromGitHub {
    owner = "Sonico98";
    repo = "exifaudio.yazi";
    rev = "master";
    hash = "sha256-RWCqWBpbmU3sh/A+LBJPXL/AY292blKb/zZXGvIA5/o=";
  };
in {
  programs.yazi.plugins.exifaudio = repo;
}

