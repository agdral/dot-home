{pkgs, ...}: {
  home.packages = with pkgs; [
    # Gui & Tui
    qalculate-gtk

    # Only Internet
    qbittorrent
    localsend
    thunderbird
    tidal-hifi

    # Vnc
    wayvnc
    tigervnc

    # System
    xdg-utils

    # Sound & Video
    nicotine-plus
    pavucontrol
    pamixer
    (import <nixpkgs-stable> {}).tauon
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
