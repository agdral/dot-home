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
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.38.1_amd64.deb";
      sha256 = "1gzlq17vsh9k9baq6lvnlvj1vs92q8rf74cqd0y1z5ffhkq34d6h";
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
