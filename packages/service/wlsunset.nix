{pkgs, ...}: {
  home.packages = [pkgs.wlsunset];
  systemd.user.services = {
    wlsunset = {
      Unit = {
        Description = "wlsunset";
        After = ["graphical-session.target"];
        Requisite = ["graphical-session.target"];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.wlsunset}/bin/wlsunset -L -58.400000 -T 6500 -g 1.000000 -l -34.600000 -t 4000";
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
