{...}: let
  utils = import ../../utils.nix;
  folderImports = utils.importFoldersExcept ./. [];
in {
  imports = folderImports;

  services = {
    hyprpolkitagent.enable = true;
  };
}

