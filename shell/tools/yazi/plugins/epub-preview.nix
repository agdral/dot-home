{pkgs, ...}: let
  repo = pkgs.fetchFromGitHub {
    owner = "kirasok";
    repo = "epub-preview.yazi";
    rev = "main";
    hash = "sha256-wHTR8frrFL3cUD8fvSTO+m/77wQ7auVjTZ1uCTB/UzU=";
  };
in {
  programs.yazi.plugins.epub-preview = repo;
}
