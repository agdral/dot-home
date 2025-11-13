{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  proton-pass-new = pkgs.proton-pass.overrideAttrs (oldAttrs: {
    version = "1.32.11";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.32.11_amd64.deb";
      sha256 = "0wda2cxf7ddawkr96ydjxmnwyihp6h3y01vv8gac9iygpfw0pv1s";
    };
  });

  proton-mail-new = pkgs.protonmail-desktop.overrideAttrs (oldAttrs: {
    version = "1.10.1";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/mail/linux/1.10.1/ProtonMail-desktop-beta.deb";
      sha256 = "0gphc7dsz0795qyl0l6cmvz51b7p9aacrziw42abahb2k9q1pgay";
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
