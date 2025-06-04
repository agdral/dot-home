{pkgs, ...}: {
  home.packages = [pkgs.syncthing];
  services.syncthing = {
    enable = true;
    guiAddress = "0.0.0.0:8384";
  };
}
