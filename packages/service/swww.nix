{pkgs, ...}: {
  home.packages = [pkgs.swww];
  systemd.user.services = {
    swww = {
      Unit = {
        Description = "Swww";
        After = ["graphical-session.target"];
        Requisite = ["graphical-session.target"];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.swww}/bin/swww-daemon --no-cache";
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
