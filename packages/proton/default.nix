{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.dotPack;
  proton-pass-new = pkgs.proton-pass.overrideAttrs (oldAttrs: {
    version = "1.31.4";

    src = pkgs.fetchurl {
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.32.6_amd64.deb";
      sha256 = "1gv92plbklkxhyzxv4pn19m9dr72757krr8s0329gmy75w96vnn6";
    };
  });
in {
  config = mkIf cfg.proton {
    home.packages = with pkgs; [
      proton-pass-new
      protonmail-desktop
    ];
  };
}
