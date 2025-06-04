{...}: {
  programs.atuin = {
    enable = true;
    enableFishIntegration = false;
    settings = {
      update_check = false;
      enter_accept = true;
      show_help = false;
      show_tabs = false;
      style = "full";
      inline_height = 20;
    };
  };
}
