{
  lib,
  buildPythonApplication,
  fetchPypi,
  requests,
  mutagen,
  dataclasses-json,
  pathvalidate,
  m3u8,
  coloredlogs,
  rich,
  toml,
  typer,
  tidalapi,
  python-ffmpeg,
  pycryptodome,
  poetry-core,
}:
buildPythonApplication rec {
  pname = "tidal_dl_ng";
  version = "0.26.6";
  pyproject = true;
  nativeBuildInputs = [poetry-core];

  src = fetchPypi {
    inherit pname version;
    sha256 = "091y2vplb7hyn7gz00902h47n8wkvhn52xh5hc3cgwrqby8h5mn0";
  };

  propagatedBuildInputs = [
    requests
    mutagen
    dataclasses-json
    pathvalidate
    m3u8
    coloredlogs
    rich
    toml
    typer
    tidalapi
    python-ffmpeg
    pycryptodome
  ];

  meta = with lib; {
    description = "A downloader for Tidal music service";
    homepage = "https://github.com/exislow/tidal-dl-ng";
    license = licenses.mit;
  };
}
