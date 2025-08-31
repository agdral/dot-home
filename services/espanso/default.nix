{pkgs, ...}: {
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    configs = {
      default = {
        show_notifications = false;
      };
    };
    matches = {
      base = {
        matches = [
          {
            trigger = ":reddit";
            replace = "site:reddit.com \n";
          }

          {
            trigger = ":github";
            replace = "site:github.com \n";
          }

          {
            trigger = ":dni";
            replace = "44552155";
          }

          {
            trigger = ":name";
            replace = "Armando Ezequiel Escobar";
          }
        ];
      };

      task = {
        matches = [
          {
            trigger = ":.p";
            replace = "project:";
          }

          {
            trigger = ":.s";
            replace = "status:";
          }

          {
            trigger = ":.n";
            replace = "project.none:";
          }

          {
            trigger = ":.d";
            replace = "+DUED";
          }
        ];
      };

      date = {
        matches = [
          {
            trigger = ":today";
            replace = "{{mydate}}";
            vars = [
              {
                name = "mydate";
                type = "date";
                params = {
                  format = "%Y-%m-%d";
                };
              }
            ];
          }

          {
            trigger = ":month";
            replace = "{{mydate}}";
            vars = [
              {
                name = "mydate";
                type = "date";
                params = {
                  format = "%Y-%m-";
                };
              }
            ];
          }

          {
            trigger = ":tomorrow";
            replace = "{{mydate}}";
            vars = [
              {
                name = "mydate";
                type = "date";
                params = {
                  format = "%Y-%m-%d";
                  offset = 86400;
                };
              }
            ];
          }

          {
            trigger = ":yesterday";
            replace = "{{mydate}}";
            vars = [
              {
                name = "mydate";
                type = "date";
                params = {
                  format = "%Y-%m-%d";
                  offset = -86400;
                };
              }
            ];
          }
        ];
      };
    };
  };
}
