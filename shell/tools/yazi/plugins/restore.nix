{pkgs, ...}: {
  programs.yazi = {
    plugins = {
      restore = pkgs.yaziPlugins.restore;
    };
    keymap.mgr.prepend_keymap = [
      # Restore
      {
        on = ["u"];
        run = "plugin restore";
        desc = "Restore last deleted files/folders";
      }
    ];
  };
}
