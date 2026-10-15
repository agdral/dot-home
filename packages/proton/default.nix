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
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.42.0_amd64.deb";
      sha256 = "0r2mjldzg5scaq6z22agmyl594mym5wpjwynhk3mmknl7nw5vh37";
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
