{...}: {
  programs = {
    starship = {
      enable = true;
      settings = {
        username = {
          style_user = "white bold";
          style_root = "black bold";
          format = "user: [$user]($style)";
          disabled = false;
          show_always = true;
        };
      };
    };
  };
}
