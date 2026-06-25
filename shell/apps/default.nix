{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotShell;
  name = "apps";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    programs = {
      bash.enable = true;
      zsh.enable = true;
      nix-index.enable = true;
      fd.enable = true;
      fzf.enable = true;
      ripgrep.enable = true;
      gh.enable = true;
      git.enable = true;
      ssh.enable = true;
      jujutsu.enable = true;
    };
  };
}
