{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  options.dotShell.atuin = mkEnableOption "atuin";
  config = mkIf cfg.atuin {
    programs = {
      atuin = {
        enable = true;
        enableFishIntegration = true;
        enableZshIntegration = true;
        settings = {
          update_check = false;
          enter_accept = true;
          show_help = false;
          show_tabs = false;
          style = "full";
          inline_height = 20;
        };
      };
      # fish = {
      #   interactiveShellInit = ''
      #     atuin init fish | sed "s/-k up/up/g" | source
      #   '';
      # };
    };
  };
}
