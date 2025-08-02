{pkgs, ...}: {
  imports = [
    ./interfaces.nix
    ./hyprland
    ./shell
    ./packages
    ./services
  ];
}
