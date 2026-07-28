{
  fetchurl,
  appimageTools,
}: let
  pname = "cardo";
  version = "1.12.0";

  executableName = "cardo";

  src = fetchurl {
    url = "https://github.com/cardo-podcast/cardo/releases/download/${version}/cardo_${version}_amd64_linux.AppImage";
    sha256 = "01lqsbbc4k10zxfwpbrq2l8i19gcrc252lzan0ak50yv1vjnmsr9";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraPkgs = pkgs: [
      pkgs.gtk3
      pkgs.webkitgtk_4_1 
      pkgs.sqlite
    ];

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/${executableName}.desktop $out/share/applications/${pname}.desktop
      install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/256x256@2/apps/${executableName}.png $out/share/icons/hicolor/512x512/apps/${pname}.png
    '';
  }
