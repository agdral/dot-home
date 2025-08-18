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
    nix-index.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fd.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
    gh.enable = true;
    git.enable = true;
    ssh.enable = true;
  };

  home.packages = with pkgs; [
    asciinema
    tidal-dl
    openssl
    infisical
    sshfs
    inetutils
  ];
}
