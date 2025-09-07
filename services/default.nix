{utils, ...}: let
  folderImports = utils.importFoldersExcept ./. [];
in {
  imports = folderImports;

  services = {
    copyq.enable = true;
    gnome-keyring.enable = true;
    swww.enable = true;
  };
}
