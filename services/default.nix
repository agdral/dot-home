{...}: let
  utils = import ./utils.nix;
  folderImports =
    utils.importFoldersExcept ./. [
    ];
in {
  imports = folderImports;

  services = {
    copyq.enable = true;
    gnome-keyring.enable = true;
  };
}
