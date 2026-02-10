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
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.34.2_amd64.deb";
      sha256 = "1qaj36vwyrz4p4ibfwxgsf3hf1yizbr00gw2by1x9nnhxkb1154b";
    };
  });

  proton-mail-new = pkgs.protonmail-desktop.overrideAttrs (oldAttrs: {
    version = "1.12.1";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/mail/linux/1.12.1/ProtonMail-desktop-beta.deb";
      sha256 = "10djrivg5z5xjr8ikq4mpk7n36hmrdm6xmqbasa7cccgxpycpnh8";
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
