{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotServ;
in {
  options.dotServ.wlsunset = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf cfg.wlsunset {
    services.wlsunset = {
      enable = true;
      latitude = -34.6;
      longitude = -58.4;
      gamma = 1.0;
      temperature = {
        day = 6500;
        night = 4000;
      };
    };
  };
}
