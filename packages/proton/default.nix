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
      url = "https://proton.me/download/mail/linux/1.13.3/ProtonMail-desktop-beta.deb";
      sha256 = "122cqyfypkrk4lnszhr0qbn9v4npr7v6nc4yj3ijbdad13syavb4";
    };
  });
  name = "proton";
in {
  options.dotPack.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    home.packages = [
      proton-pass-new
      proton-mail-new
    ];
  };
}
