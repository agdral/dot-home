{...}: {
  programs.fish.functions = {
    d-penpot = ''
      docker-if penpot-penpot-frontend-1 $path_docker/Penpot/docker-compose.yml http://localhost:9005/
    '';
    d-noco = ''
      docker-if nocodb-nocodb-1 $path_docker/NocoDB/docker-compose.yml http://localhost:8080/dashboard/#/
    '';
    d-erp = ''
      docker-if frappe_docker-frontend-1 $path_docker/frappe_docker/pwd.yml http://192.168.0.50:80/
    '';
    d-port = ''
      docker-if portainer $path_docker/Portainer/docker-compose.yml http://192.168.0.50:9005/
    '';

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
