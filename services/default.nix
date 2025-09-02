{...}:
{
  imports = [
    ./hyprPolkit
    ./pyprland
    ./swww
    ./syncthing
  ];

  services = {
    copyq.enable = true;
    gnome-keyring.enable = true;
  };
}
