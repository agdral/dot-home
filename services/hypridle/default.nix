{...}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "safeeyes -d"; # && cotronlBlue PowerAll 0
          on-resume =  "safeeyes -e"; # && controlBlue PowerAll 1
        }
        {
          timeout = 3600;
          on-timeout = "poweroff"; # cotronlBlue PowerAll 0 && 
        }
      ];
    };
  };
}
