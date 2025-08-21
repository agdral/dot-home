{...}: {
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      update_check = false;
      enter_accept = true;
      show_help = false;
      show_tabs = false;
      style = "full";
      inline_height = 20;
    };
  };
  fish = {
    interactiveShellInit = ''
      bind up _atuin_bind_up
    '';
  };
}
