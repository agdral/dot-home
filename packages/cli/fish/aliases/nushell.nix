{...}: {
  programs.fish.functions = {
    lsn = ''nu -c "ls . | where name =~ '$argv' "'';
    lsd = ''nu -c "ls $argv | where type == dir "'';
    lsf = ''nu -c "ls $argv | where type == file "'';
    ls = ''nu -c "ls $argv"'';
    nx = ''nu -c "$argv"'';
    ps = ''nu -c "ps $argv"'';
    sys = ''nu -c "sys $argv"'';
  };
}

