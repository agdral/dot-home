{
  lib,
  python311,
  fetchPypi,
  pkgsCross,
  avrdude,
  bootloadhid,
  dfu-programmer,
  dfu-util,
  wb32-dfu-updater,
  gcc-arm-embedded,
  gnumake,
  teensy-loader-cli,
}:

python311.pkgs.buildPythonApplication (finalAttrs: {
  pname = "qmk";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-FkvRbExAGyt2XuTwF7z6gUGULd82KWHEy6GXXYyyikg=";
  };

  nativeBuildInputs = with python311.pkgs; [
    setuptools
  ];

  propagatedBuildInputs =
    with python311.pkgs;
    [
      dotty-dict
      hid
      hjson
      jsonschema
      milc
      pygments
      pyserial
      pyusb
      pillow
    ]
    ++ [
      avrdude
      bootloadhid
      dfu-programmer
      dfu-util
      wb32-dfu-updater
      teensy-loader-cli
      gcc-arm-embedded
      gnumake
      pkgsCross.avr.buildPackages.binutils
      pkgsCross.avr.buildPackages.binutils.bintools
      pkgsCross.avr.buildPackages.gcc
      pkgsCross.avr.libc
    ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/qmk/qmk_cli";
    description = "Program to help users work with QMK Firmware";
    longDescription = ''
      qmk_cli is a companion tool to QMK firmware.
    '';
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "qmk";
  };
})
