{pkgs, ...}: {
  home.packages = [pkgs.hyprpolkitagent];
  systemd.user.services = {
    polkit-hyprland-authentication-agent = {
      Unit = {
        Description = "polkit-hyprland-authentication-agent";
        After = ["graphical-session.target"];
        Requisite = ["graphical-session.target"];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
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
