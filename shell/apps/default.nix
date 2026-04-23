{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  options.dotShell.apps = mkEnableOption "apps";
  config = mkIf cfg.apps {
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

    home.packages = with pkgs; [
      openssl
      inetutils
    ];
  };
}
