{
  fetchurl,
  appimageTools,
  imagemagick,
}:

let
  pname = "plane";
  version = "2.0.0";

  executableName = "desktop";

  src = fetchurl {
    url = "https://dl.todesktop.com/260130r75i625/builds/260325tah3zsnil/linux/appImage/x64";
    sha256 = "0v7prcrkkp07hdrcbx17rnmmk6s57jm5dsbq1s5f7b4mbp58pnv9";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${executableName}.desktop $out/share/applications/${pname}.desktop
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/desktop.png $out/share/icons/hicolor/512x512/apps/${pname}.png

    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=${executableName} --no-sandbox %U'
  '';
}

