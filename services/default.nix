{
  lib,
  tools,
  ...
}:
with lib; let
  mkBoolOption = desc:
    mkOption {
      type = types.bool;
      default = false;
      description = desc;
    };
in {
  imports = tools.importFoldersExcept ./. [];
  options.dotServ = {
    syncthing = mkBoolOption "Enable Syncthing";
    openTablet = mkBoolOption "Enable openTablet";
    wlsunset = mkBoolOption "Enable wlsunset";
  };
}
