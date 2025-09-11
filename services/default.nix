{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotServ;
  mkBoolOption = desc: mkOption {
    type = types.bool;
    default = false;
    description = desc;
  };
in {
  options.dotServ = {
    enable = mkBoolOption "Enable dotServ";    
    syncthing =mkBoolOption "Enable Syncthing"; 
    openTablet =mkBoolOption "Enable openTablet"; 
    wlsunset =mkBoolOption "Enable wlsunset"; 
  };

  config = mkIf cfg.enable (
    {}
    // optionalAttrs cfg.syncthing import ./syncthing
    // optionalAttrs cfg.openTablet import ./openTablet
    // optionalAttrs cfg.wlsunset import ./wlsunset
  );
}
