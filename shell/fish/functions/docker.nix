{
  dks = "docker ps -a --format 'table {{.ID}}\\t{{.Names}}'";
  dka = "docker ps --format 'table {{.ID}}\\t{{.Names}}'";
  dc = "docker compose $argv";
  dv = "docker volume $argv";
  dv-copy = ''
    docker run --rm -v $argv[1]:/from -v $argv[2]:/to alpine \
    sh -c "cd /from && cp -av . /to"
  '';
  dv-view = ''
    docker run -it --rm -v $argv[1]:/data alpine sh
  '';
  dc-i1 = ''
    infisical export --env=prod --format=dotenv > .env
    docker compose up -d
  '';
  dc-i2 = ''
    infisical export --env=prod --format=dotenv > .env
    infisical export --env=db --format=dotenv > .db.env
    docker compose up -d
  '';
}
