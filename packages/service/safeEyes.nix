{pkgs, ...}: {
  home.packages = [pkgs.safeeyes];
  systemd.user.services = {
    safeeyes = {
      Unit = {
        Description = "Safe Eyes";
        After = ["graphical-session.target"];
        Requisite = ["graphical-session.target"];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.safeeyes}/bin/safeeyes";
        ExecReload = "${pkgs.safeeyes}/bin/safeeyes -q";
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
