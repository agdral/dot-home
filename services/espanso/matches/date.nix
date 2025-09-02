{
  services.espanso.matches = {
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
}
