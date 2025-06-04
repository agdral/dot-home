{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [taskwarrior-tui taskopen];
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    config = {
      confirmacion = true;
      uda.taskwarrior-tui.task-report.show-info = false;
      report.next.filter = "status:pending project.isnt:dates and project.isnt:cumples";
      uda.taskwarrior-tui.task-report.looping = false;
      uda.taskwarrior-tui.scrollbar.area = "|";
      uda.taskwarrior-tui.keyconfig.filter = ":";
      uda.taskwarrior-tui.keyconfig.modify = "r";
      uda.taskwarrior-tui.keyconfig.refresh = "m";
      uda.taskwarrior-tui.keyconfig.quit = "Q";
    };
    dataLocation = "${config.home.homeDirectory}/Apps/TaskWarrior";
  };
}
