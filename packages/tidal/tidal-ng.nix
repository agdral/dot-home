{
  lib,
  buildPythonApplication,
  fetchPypi,
  requests,
}:
buildPythonApplication rec {
  pname = "tidal_dl_ng";
  version = "0.26.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1grd8rq2cx9357009591f2vkmg2qvw0dadydh8kx0ayp2mih8bg8";
  };

  propagatedBuildInputs = [requests];

  meta = with lib; {
    description = "A downloader for Tidal music service";
    homepage = "https://github.com/exislow/tidal-dl-ng";
    license = licenses.mit;
  };
}
