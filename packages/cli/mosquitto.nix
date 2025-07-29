{pkgs, ...}: {
  home.packages = [pkgs.mosquitto];
  home.file = {
    ".config/mosquitto/mosquitto.conf".text = ''
      listener 1883
      allow_anonymous true
    '';
  };
}
