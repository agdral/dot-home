{
  pkgs,
  ...
}: let
in {
  home.packages = with pkgs; [
    proton-pass
  ];
}
