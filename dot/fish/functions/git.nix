{
  programs.fish = {
    shellAbbrs = {
      gga = "git add";
      ggm = "git commit -m";
      ggp = "git push";
      ggl = "git pull";
    };
    functions = {
      gits = "gita super status --short";
      gitp = "gita super pull";
    };
  };
}
