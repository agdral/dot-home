{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotServ;
in {
  options.dotServ.syncthing = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf cfg.syncthing {
    services.syncthing = {
      enable = true;
      guiAddress = "0.0.0.0:8384";
    };
  };
}
