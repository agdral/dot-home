{...}: {
  programs.fish.functions = {
    docker-if = ''
      set i_service (docker inspect --format '{{.State.Running}}' $argv[1])
      if test "$i_service" = true
          docker compose -f $argv[2] stop
      else
          docker compose -f $argv[2] up -d
          firefox -p argonarch $argv[3]
      end
    '';
    docks = "docker ps -a --format 'table {{.ID}}\\t{{.Names}}\\t{{.Ports}}'";
    dc = "docker compose $argv";
    dv = "docker volume $argv";
  };
}

