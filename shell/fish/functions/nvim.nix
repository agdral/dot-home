{...}: {
  programs.fish.functions = {
    nv = ''
      neovide --wayland_app_id=neovide $argv >/dev/null 2>&1 &
      disown
    '';
    nc = ''
      neovide --wayland_app_id=Code $argv >/dev/null 2>&1 &
      disown
    '';
    n = "nv .";
    v = "nc .";
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
    nt = "nc $(mktemp /tmp/temp/note-XXXXXX.txt) -- -c 'cd /tmp/temp'";
  };
}
