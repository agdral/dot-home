{pkgs, ...}: {
  home.packages = [pkgs.opentabletdriver];
  systemd.user.services = {
    openTabletDriver = {
      Unit = {
        Description = "Open Tablet Driver";
        After = ["graphical-session.target"];
        Requisite = ["graphical-session.target"];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.opentabletdriver}/bin/otd-daemon";
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
}
