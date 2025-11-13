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
in {
  config = mkIf cfg.proton {
    home.packages = with pkgs; [
      proton-pass-new
      protonmail-desktop
    ];
  };
}
