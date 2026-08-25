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
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.39.1_amd64.deb";
      sha256 = "1q2vdkd6kism2d2i3xp5yv8iz0j6zy3y5aysxpmdx45wq7l6sfyw";
    };
  });

  name = "proton";
in {
  options.dotPack.${name} = mkEnableOption "${name}";
  config = mkIf cfg.${name} {
    home.packages = [
      proton-pass-new
    ];
  };
}
