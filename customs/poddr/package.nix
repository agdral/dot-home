{
  fetchurl,
  appimageTools,
  imagemagick,
}:

let
  pname = "poddr";
  version = "2.1.0";

  executableName = "poddr";

  src = fetchurl {
    url = "https://github.com/Sn8z/Poddr/releases/download/v${version}/Poddr-${version}.AppImage";
    sha256 = "1gsgwylsy4p6g2hjk1zshc4kf744a376b16zzz8x4py3xdm3m7f5";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/${executableName}.desktop $out/share/applications/${pname}.desktop
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/512x512/apps/${executableName}.png $out/share/icons/hicolor/512x512/apps/${pname}.png

    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=${executableName} --no-sandbox %U'
  '';
}

