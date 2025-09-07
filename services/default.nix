{tools, ...}: {
  imports = tools.importFoldersExcept ./. [];

  services = {
    copyq.enable = true;
    gnome-keyring.enable = true;
    swww.enable = true;
  };
}
