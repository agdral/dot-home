{config, ...}: {
  programs.fish.functions = {
    tasks = "task limit:33 $argv";
    tu = ''
      remove-file ${config.home.homeDirectory}/.local/share/taskwarrior-tui/filter.history
      remove-file ${config.home.homeDirectory}/.local/share/taskwarrior-tui/command.history
      taskwarrior-tui
    '';
    tn = "tasks project.none: $argv";
    t = "tasks $argv";
    t-cumple = ''      
      task add project:cumples due:$argv[1] recur:yearly "$argv[2..-1]"
      ctask
    '';
    tc = ''      
      task add project:dates due:$argv[1] recur:yearly "$argv[2..-1]"
      ctask
    '';
    tt = ''      
      task add project:dates due:$argv[1] "$argv[2..-1]"
      ctask
    '';
    tm = "task $argv[1] modify $argv[2]";
    ta = "tasks project.any: $argv";
    tr = "task rm $argv";
    td = "task add $argv";
    jd = "just task $argv";
    jt = "just task-add";
  };
}
