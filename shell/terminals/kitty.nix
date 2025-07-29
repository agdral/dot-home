{...}: {
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 13.0;
      scrollback_lines = 8000;
      confirm_os_window_close = 0;
      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_title_max_length = 3;
      tab_title_template = "{index}";
      shell = "fish";
      editor = "nvim";
    };
    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "ctrl+page_down" = "next_tab";
      "super+h" = "next_tab";
      "ctrl+page_up" = "previous_tab";
      "super+g" = "previous_tab";
      "ctrl+shift+t" = "new_tab";
    };
    themeFile = "Catppuccin-Mocha";
  };
}
