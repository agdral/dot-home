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
    ./direnv
  ];
  programs = {
    starship.enable = true;
    zoxide.enable = true;
    nix-index.enable = true;
    fd.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
    gh.enable = true;
    git.enable = true;
    ssh.enable = true;
    jujutsu.enable = true;
  };

  home.packages = with pkgs; [
    asciinema
    openssl
    infisical
    sshfs
    inetutils
    mosh
    claude-code
    pipx
  ];
}
