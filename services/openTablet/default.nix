{
  config,
  lib,
  pkgs-stable,
  ...
}:
with lib; let
  cfg = config.dotServ;
in {
  options.dotServ.openTablet = mkOption {
    type = types.bool;
    default = false;
  };
  config = mkIf cfg.openTablet {
    home.packages = [pkgs-stable.opentabletdriver];
    systemd.user.services = {
      openTabletDriver = {
        Unit = {
          Description = "Open Tablet Driver";
          After = ["graphical-session.target"];
          Requisite = ["graphical-session.target"];
        };
        Service = {
          Type = "simple";
          ExecStart = "${pkgs-stable.opentabletdriver}/bin/otd-daemon";
          ExecReload = "kill -SIGUSR2 $MAINPID";
          Restart = "on-failure";
          RestartSec = 3;
          TimeoutStopSec = 10;
        };
        Install = {
          WantedBy = ["graphical-session.target"];
        };
      };
    };
  };
}
