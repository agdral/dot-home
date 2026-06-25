{
  pkgs,
  lib,
  config,
  joinix,
  ...
}:
with lib; let
  settingsF = import ./settings.nix;
  themeF = import ./theme.nix;
  keymapsF = joinix.importNixList ./keymaps;
  pluginsF = import ./plugins.nix {inherit pkgs;};
  cfg = config.dotShell;
  name = "yazi";
in {
  options.dotShell.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    home.packages = with pkgs; [
      unzip
      poppler
      ffmpegthumbnailer
      jq
      imagemagick
      exiftool
      mediainfo
      ouch
      transmission_4
      epub-thumbnailer
      p7zip
    ];

    programs.yazi = {
      enable = true;
      settings = settingsF;
      theme = themeF;
      keymap.mgr.prepend_keymap = keymapsF;
      plugins = pluginsF;
    };

    home.file = {
      ".config/yazi/init.lua".source = ./dot/init.lua;
    };
  };
}
