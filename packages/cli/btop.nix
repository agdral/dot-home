{...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = false;
      proc_tree = true;
    };
  };
}
