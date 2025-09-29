{
  lib,
  tools,
  ...
}:
with lib; let
  mkBoolOption = desc:
    mkOption {
      type = types.bool;
      default = false;
      description = desc;
    };
in {
  imports = tools.importFoldersExcept ./. [];
  options.dotShell = {
    apps = mkBoolOption "Enable apps default";
    atuin = mkBoolOption "Enable atuin default";
    btop = mkBoolOption "Enable btop default";
    direnv = mkBoolOption "Enable direnv default";
    fish = mkBoolOption "Enable fish default";
    gitui = mkBoolOption "Enable gitui default";
    kitty = mkBoolOption "Enable kitty default";
    payRespect = mkBoolOption "Enable payRespect default";
    starship = mkBoolOption "Enable starship default";
    yazi = mkBoolOption "Enable yazi default";
    zsh = mkBoolOption "Enable zsh default";
  };
}
