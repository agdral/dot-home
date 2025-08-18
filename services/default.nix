{...}: {
  imports = [
    ./espanso
    ./swww
    ./syncthing
    ./hyprPolkit
    ./pyprland
  ];

  services = {
    copyq = {
      enable = true;
    };
    gnome-keyring.enable = true;
    ssh-agent.enable = true;
  };
}
