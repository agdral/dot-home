{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.dotShell;
in {
  config = mkIf cfg.apps {
    programs = {
      zoxide.enable = true;
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
      tree
      asciinema
      openssl
      infisical
      sshfs
      inetutils
      mosh
      pipx
    ];
  };
}
