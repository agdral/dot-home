{utils, ...}: let
  folderImports = utils.importFoldersExcept ./. [];
in {
  imports = folderImports;

  services = {
    hyprpolkitagent.enable = true;
  };
}
