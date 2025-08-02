{pkgs, ...}: {
  programs.yazi = {
    plugins = {
      mount = pkgs.yaziPlugins.mount;
    };
    keymap.mgr.prepend_keymap = [
      {
        on = "M";
        run = "plugin mount";
      }
    ];
  };
}
