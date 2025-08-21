{...}: {
  programs = {
    atuin = {
      enable = true;
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
      atuin init fish | source
        bind up _atuin_bind_up
      '';
    };
  };
}
