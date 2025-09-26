{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotServ;
in {
  config = mkIf cfg.syncthing {
    services.syncthing = {
      enable = true;
      guiAddress = "0.0.0.0:8384";
      ceoh = "truene";
    };
  };
}
