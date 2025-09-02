{pkgs, ...}: {
  imports = [
    ./matches/base.nix
    ./matches/date.nix
  ];
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    configs = {
      default = {
        show_notifications = false;
      };
    };
  };
}
