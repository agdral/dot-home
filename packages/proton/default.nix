{
  pkgs,
  ...
}: let
  proton-pass-new = pkgs.proton-pass.overrideAttrs (oldAttrs: {
    version = "1.32.2";
    src = pkgs.fetchurl {
      url = "https://proton.me/download/pass/linux/x64/proton-pass_1.32.2_amd64.deb";
      hash = "sha256-j/25TaZKvMFIB18InRD1kknwXNmHxUpl6xU3WdrvRrk=";
    };
  });
in {
  home.packages = with pkgs; [
    proton-pass-new
  ];
}
