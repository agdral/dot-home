{
  programs.fish = {
    shellAbbrs = {
      gga = "git add";
      ggm = "git commit -m";
      ggp = "git push";
    };
    functions = {
      gits = "gita super status --short";
    };
  };
}
