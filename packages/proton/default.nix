{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  proton-pass-new = pkgs.proton-pass.overrideAttrs (oldAttrs: {
    version = "1.33.5";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.33.5_amd64.deb";
      sha256 = "06vfw22dwfsb8fym9gg1ykivbqph8r9vgkqyvgrychjliym36zyq";
    };
  });

  proton-mail-new = pkgs.protonmail-desktop.overrideAttrs (oldAttrs: {
    version = "1.11.0";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/mail/linux/1.12.0/ProtonMail-desktop-beta.deb";
      sha256 = "1ifknan5xxy9v2bysx4inf36syn0lng5rl0pb9jsv12qf9d9jhx1";
    };
  });
in {
  config = mkIf cfg.proton {
    home.packages = [
      proton-pass-new
      proton-mail-new
    ];
  };
}
