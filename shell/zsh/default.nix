{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  config = mkIf cfg.zsh {
    programs.zsh = {
      enable = true;
      initContent = ''
        eval "$(starship init zsh)"
        eval "$(atuin init zsh)"
        eval "$(zoxide init zsh)"
      '';
    };
  };
}
