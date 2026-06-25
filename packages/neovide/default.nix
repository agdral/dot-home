{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  name = "neovide";
in {
  options.dotPack.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    programs.neovide = {
      enable = true;
      settings = {
        fork = true;
      };
    };
  };
}
