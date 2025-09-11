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
    sha256 = "091y2vplb7hyn7gz00902h47n8wkvhn52xh5hc3cgwrqby8h5mn0";
  };

  propagatedBuildInputs = [requests];

  meta = with lib; {
    description = "A downloader for Tidal music service";
    homepage = "https://github.com/exislow/tidal-dl-ng";
    license = licenses.mit;
  };
}
