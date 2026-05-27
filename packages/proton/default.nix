{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  proton-pass-new = pkgs.proton-pass.overrideAttrs (oldAttrs: {
    src = pkgs.fetchurl {
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.37.0_amd64.deb";
      sha256 = "0v87f42phlpzgz71drp4j5pixnxb60w6284y8w1kvsxb08a6zcih";
    };
  });

  proton-mail-new = pkgs.protonmail-desktop.overrideAttrs (oldAttrs: {
    src = pkgs.fetchurl {
      url = "https://proton.me/download/mail/linux/1.13.1/ProtonMail-desktop-beta.deb";
      sha256 = "0jm3k6jy4gws3q1cykzzwa9ayxwhj56msfsmyz7dgy9ymchj1qwq";
    };
  });
in {
  options.dotPack.proton = mkEnableOption "proton";
  config = mkIf cfg.proton {
    home.packages = [
      proton-pass-new
      proton-mail-new
    ];
  };
}
