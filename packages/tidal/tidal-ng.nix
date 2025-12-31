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
  ansi2html,
  tidalapi,
  python-ffmpeg,
  pycryptodome,
  poetry-core,
}:
buildPythonApplication rec {
  pname = "tidal_dl_ng";
  version = "0.33.0";
  pyproject = true;
  nativeBuildInputs = [poetry-core];

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-rOMyxnT7uVnMbn678DFtqAu4+Uc5VFGcqGI0jxplnpc=";
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
    ansi2html
  ];

  pythonRemoveDeps = true;

  meta = with lib; {
    description = "A downloader for Tidal music service";
    homepage = "https://github.com/exislow/tidal-dl-ng";
    license = licenses.mit;
  };
}
