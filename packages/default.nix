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
  options.dotPack = {
    apps = mkBoolOption "Enable apps default";
    firefox = mkBoolOption "Enable firefox";
    neovide = mkBoolOption "Enable neovide";
    proton = mkBoolOption "Enable proton";
    tidal = mkBoolOption "Enable tidal";
  };
}
