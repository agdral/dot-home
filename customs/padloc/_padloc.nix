{
  fetchurl,
  appimageTools,
  makeWrapper,
  imagemagick,
}: let
  pname = "padloc";
  version = "4.3.0";

  executableName = "padloc";

  src = fetchurl {
    url = "https://github.com/padloc/padloc/releases/download/v${version}/padloc_${version}_linux_electron_x86_64.AppImage";
    sha256 = "07jcc8h0vhjahp3j9mrxbkqxgsimdyqdqa9jvsm5vblrl0c1rs87";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
  appimageTools.wrapType2 {
    inherit pname version src;
    nativeBuildInputs = [makeWrapper];
    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${executableName}.desktop $out/share/applications/${executableName}.desktop
      ${imagemagick}/bin/magick ${appimageContents}/${executableName}.png -resize 512x512 ${pname}_512.png
      install -m 444 -D ${pname}_512.png $out/share/icons/hicolor/512x512/apps/${executableName}.png

      substituteInPlace $out/share/applications/${executableName}.desktop \
        --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=${executableName} --no-sandbox %U'
    '';
  }
