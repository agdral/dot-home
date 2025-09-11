{
  lib,
  python3Packages,
  fetchPypi,
}:
python3Packages.buildPythonPackage rec {
  pname = "tidal-dl-ng";
  version = "0.26.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "091y2vplb7hyn7gz00902h47n8wkvhn52xh5hc3cgwrqby8h5mn0"; 
  };

  propagatedBuildInputs = with python3Packages; [requests];

  meta = with lib; {
    description = "A downloader for Tidal music service";
    homepage = "https://github.com/exislow/tidal-dl-ng";
    license = licenses.mit;
  };
}
