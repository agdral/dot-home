{
  pkgs,
  ...
}: let
  proton-pass-new = pkgs.proton-pass.overrideAttrs (oldAttrs: {
    version = "1.31.4";
    src = pkgs.fetchurl {
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.31.4_amd64.deb";
      hash = "sha256-gl4qCj9BAN9B09b+F78v0f3tUyxRU4/IpsSvtK0CZOM=";
    };
  });
in {
  home.packages = with pkgs; [
    proton-pass-new
    protonmail-desktop
  ];
}
