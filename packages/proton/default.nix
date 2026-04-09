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
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.36.0_amd64.deb";
      sha256 = "0v922ryjzfi6vwh6xyaq4grcwaqzz29galhgpmn2qiwj91ihz63c";
    };
  });

  proton-mail-new = pkgs.protonmail-desktop.overrideAttrs (oldAttrs: {
    src = pkgs.fetchurl {
      url = "https://proton.me/download/mail/linux/1.12.1/ProtonMail-desktop-beta.deb";
      sha256 = "10djrivg5z5xjr8ikq4mpk7n36hmrdm6xmqbasa7cccgxpycpnh8";
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
