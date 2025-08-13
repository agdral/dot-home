{pkgs, ...}: {
  imports = [
    ./fish
    ./zsh
    ./foot
    ./kitty
    ./yazi
    ./atuin
    ./btop
    ./gitui
  ];
  programs = {
    starship.enable = true;
    zoxide.enable = true;
    nix-index.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    thefuck.enable = true;
  };

  home.packages = with pkgs; [
    asciinema
    tidal-dl
    openssl
  ];
}
