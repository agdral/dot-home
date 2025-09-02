{
  services.espanso.matches = {
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
  };
}
