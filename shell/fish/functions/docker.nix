{
  docks = "docker ps -a --format 'table {{.ID}}\\t{{.Names}}\\t{{.Ports}}'";
  dc = "docker compose $argv";
  dv = "docker volume $argv";
  dv-copy = ''
    docker run --rm -v $argv[1]:/from -v $argv[2]:/to alpine \
    sh -c "cd /from && cp -av . /to"
  '';
  dv-view = ''
    docker run -it --rm -v $argv[1]:/data alpine sh
  '';
}
