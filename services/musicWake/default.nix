{pkgs, ...}: {
  systemd.user = {
    timers = {
      music-play = {
        Unit = {
          Description = "Timer para reproducir música";
          WantedBy = ["timers.target"];
        };
        Timer = {
          OnCalendar = ["*-*-* 06:30:00"];
          Unit = ["music-play.service"];
        };
        Install = {
          WantedBy = ["timers.target"];
        };
      };
      volume-increase = {
        Unit = {
          Description = "Timer para aumentar volumen gradualmente";
        };
        Timer = {
          OnCalendar = ["*-*-* 06:30:00"];
          Unit = ["volume-increase.service"];
        };
        Install = {
          WantedBy = ["timers.target"];
        };
      };
    };
    services = {
      music-play = {
        Unit = {
          Description = "Reproduce música y ajusta el volumen";
        };
        Service = {
          Type = "oneshot";
          ExecStartPre = "${pkgs.pamixer}/bin/pamixer --set-volume 20";
          ExecStart = "${pkgs.tauon}/bin/tauon --no-start --play-pause";
        };
      };
      volume-increase = {
        Unit = {
          Description = "Aumenta el volumen en 2%";
        };
        Service = {
          Type = "oneshot";
          ExecStart = ''
            ${pkgs.bash}/bin/bash -c '
              for i in {1..30}; do
                sleep 60
                ${pkgs.pamixer}/bin/pamixer --increase 2
              done
            '
          '';
        };
      };
    };
  };
}
