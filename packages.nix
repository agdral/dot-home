{pkgs, ...}: {
  home.packages = with pkgs; [
    # Gui & Tui
    qalculate-gtk
    authenticator
    calibre
    calcure
    proton-pass

    # Only Internet
    qbittorrent
    localsend
    thunderbird
    tidal-hifi

    # Hypr
    hyprshot
    grimblast
    hyprpicker
    hyprland-qtutils

    # Vnc
    wayvnc
    tigervnc

    # System
    xdg-utils

    # Sound & Video
    nicotine-plus
    pavucontrol
    pamixer
    tauon
    selectdefaultapplication
  ];

  programs = {
    home-manager.enable = true;
    mpv.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    zathura.enable = true;
    zoxide.enable = true;
    nix-index.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  services = {
    copyq = {
      enable = true;
      # package = (import <nixpkgs-stable> {}).copyq;
    };
    gnome-keyring.enable = true;
    ssh-agent.enable = true;
  };
}
