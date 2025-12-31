{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  proton-pass-new = pkgs.proton-pass.overrideAttrs (oldAttrs: {
    version = "1.33.3";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.33.3_amd64.deb";
      sha256 = "1nc8i03nfy8rldplmd07zp6qaff58bpcdp4yimsx48dmxygyivym";
    };
  });

  proton-mail-new = pkgs.protonmail-desktop.overrideAttrs (oldAttrs: {
    version = "1.11.0";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/mail/linux/1.11.0/ProtonMail-desktop-beta.deb";
      sha256 = "1fjw12p76idn9vx0cq3s8dajpqspnl17q5bkycd4kybpg883hqcj";
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
