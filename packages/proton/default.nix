{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  proton-pass-new = pkgs.proton-pass.overrideAttrs (oldAttrs: {
    version = "1.33.0";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.33.0_amd64.deb";
      sha256 = "1a5cpvb1h12dl0613ccv1rvkmz9rp1kp0i5xhlb38vlsbxhkxc0h";
    };
  });

  proton-mail-new = pkgs.protonmail-desktop.overrideAttrs (oldAttrs: {
    version = "1.10.10";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/mail/linux/1.10.10/ProtonMail-desktop-beta.deb";
      sha256 = "0w0a0lkff4fg0sn221p6yn0ffyw132hnqm8i8s37fg4jnbmf00ks";
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
