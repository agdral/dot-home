{pkgs, ...}: {
  home.packages = with pkgs; [
    tidal-hifi
    tauon
    spotify
  ];
}
