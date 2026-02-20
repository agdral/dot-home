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
  pyside6,
}:
buildPythonApplication rec {
  pname = "tidal_dl_ng_for_dj";
  version = "0.33.2";
  pyproject = true;
  nativeBuildInputs = [poetry-core];

  src = fetchPypi {
    inherit pname version;
    sha256 = "0m7wxyb66s3yz5j796zqll363vwb1ap13b8mngxs4mwr3a05qkpb";
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
    pyside6
  ];

  pythonRemoveDeps = true;

  meta = with lib; {
    description = "A downloader for Tidal music service";
    homepage = "https://github.com/botezat/newNG";
    license = licenses.mit;
  };
}
