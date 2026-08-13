{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
  name = "starship";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      settings = {
        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_status"
          "$cmd_duration"
          "$time"
          "$line_break"
          "$character"
        ];
        username = {
          style_user = "white bold";
          style_root = "black bold";
          format = "[$user]($style)  ";
          disabled = false;
          show_always = true;
        };
        time = {
          disabled = false;
          format = "  [$time]($style) ";
          time_format = "%T";
          utc_time_offset = "-3";
        };
      };
    };
  };
}
