{
  docks = "docker ps -a --format 'table {{.ID}}\\t{{.Names}}\\t{{.Ports}}'";
  dc = "docker compose $argv";
  dv = "docker volume $argv";
}
