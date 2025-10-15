{...}: {
  programs.fish.functions = {
    cv = ''
      neovide --wayland_app_id=neovide $argv
    '';
    cn = ''
      neovide --wayland_app_id=Code $argv
    '';

    n = "$editor_1 .";
    v = "$editor_2 .";

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

    nt = "$editor_2 $(mktemp /tmp/temp/note-XXXXXX.txt) -- -c 'cd /tmp/temp'";
  };
}
