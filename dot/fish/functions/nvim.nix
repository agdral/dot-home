{...}: {
  programs.fish.functions = {
    cn = ''
      neovide --wayland_app_id=neovide $argv
    '';
    cv = ''
      neovide --wayland_app_id=Code $argv
    '';

    n = "cn .";
    v = "cv .";

    c = "code .";

    zn = ''
      set result (zoxide query $argv)
      cd $result
      n
    '';
    zc = ''
      set result (zoxide query $argv)
      cd $result
      v
    '';

    nt = "cv $(mktemp /tmp/temp/note-XXXXXX.txt) -- -c 'cd /tmp/temp'";
  };
}
