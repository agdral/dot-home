{
  cn = ''
    neovide --wayland_app_id=neovide $argv
  '';
  cv = ''
    neovide --wayland_app_id=Code $argv
  '';

  n = "cn .";
  s = "cs .";

  c = "code .";

  zn = ''
    set result (zoxide query $argv)
    cd $result
    n
  '';
  zc = ''
    set result (zoxide query $argv)
    cd $result
    s
  '';

  nt = "cs $(mktemp /tmp/temp/note-XXXXXX.txt) -- -c 'cd /tmp/temp'";
}
