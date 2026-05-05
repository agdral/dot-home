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
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.36.1_amd64.deb";
      sha256 = "1q2r7yk1hdjv9hpwj6f956ai9yi6q6n0m59iy4p1amq3c18vban3";
    };
  });

  proton-mail-new = pkgs.protonmail-desktop.overrideAttrs (oldAttrs: {
    src = pkgs.fetchurl {
      url = "https://proton.me/download/mail/linux/1.13.0/ProtonMail-desktop-beta.deb";
      sha256 = "0xggin2ggvfjm8y7138chv7kzwrkajmq0ibg6qpa964mx68w66vs";
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
