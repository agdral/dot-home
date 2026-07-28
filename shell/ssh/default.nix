{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotShell;
  name = "ssh";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    ssh = {
      enable = true;
      enableDefaultConfig = false;

      extraConfig = ''
        ForwardAgent no
      '';

      settings = {
        "*" = {
          hashKnownHosts = true;
          addKeysToAgent = "yes";
          serverAliveInterval = 60;
          serverAliveCountMax = 3;
        };
        extraOptions = {
          PubkeyAcceptedAlgorithms = "ssh-ed25519";
          HostKeyAlgorithms = "ssh-ed25519";
        };
      };
    };
  };
}
