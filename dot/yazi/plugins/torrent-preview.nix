{pkgs, ...}: let
  repo = pkgs.fetchFromGitHub {
    owner = "kirasok";
    repo = "torrent-preview.yazi";
    rev = "main";
    hash = "sha256-VhJvNRKHxVla4v2JJeSnP0MOMBFSm4k7gfqjrHOMVlo=";
  };
in {
  torrent-preview = repo;
}

