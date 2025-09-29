{
  programs.fish.functions = {
    ls = ''nu -c "ls $argv"'';
    ps = ''nu -c "ps $argv"'';
    sys = ''nu -c "sys $argv"'';
    di = "dust -RpD -d 1";
  };
}
