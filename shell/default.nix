{pkgs, ...}: {
  imports = [
    ./fish
    ./zsh
    ./kitty
    ./yazi
    ./atuin
    ./btop
    ./gitui
    ./payRespect
  ];
  programs = {
    starship.enable = true;
    zoxide.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  home.packages = with pkgs; [
    asciinema
    tidal-dl
    openssl
  ];
}
