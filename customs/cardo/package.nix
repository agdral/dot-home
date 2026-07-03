{
  fetchurl,
  fetchFromGitHub,
  stdenv,
  dpkg,
  autoPatchelfHook,
  makeWrapper,
  lib,
  sqlite,
}: let
  pname = "cardo";
  version = "1.12.0";

  oldNixpkgs = fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "a3eaf5e8eca7cab680b964138fb79073704aca75";
    sha256 = "sha256-yWNBf6VDW38tl179FEuJ0qukthVfB02kv+mRsfUsWC0=";
  };

  legacyPkgs = import oldNixpkgs {
    system = "x86_64-linux";
  };

  src = fetchurl {
    url = "https://github.com/cardo-podcast/cardo/releases/download/${version}/cardo_${version}_amd64_linux.deb";
    sha256 = "02pvhd72dmx84mxk9zmpn361768lwsbi1fw4a5fwyvh9j036d13a";
  };
in
  stdenv.mkDerivation rec {
    inherit pname version src;

    nativeBuildInputs = [
      dpkg
      autoPatchelfHook
      makeWrapper
    ];

    buildInputs = [
      legacyPkgs.gtk3
      legacyPkgs.webkitgtk_4_0
      legacyPkgs.libsoup_2_4
      legacyPkgs.sqlite
    ];

    unpackCmd = "dpkg-deb -x $src .";

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin $out/share $out/lib

      cp -r bin/* $out/bin/
      cp -r share/* $out/share/
      cp -r lib/* $out/lib/

      runHook postInstall
    '';

    meta = with lib; {
      description = "Podcast client";
      homepage = "https://github.com/cardo-podcast/cardo";
      license = licenses.gpl3Plus;
      platforms = ["x86_64-linux"];
      mainProgram = "cardo";
    };
  }
