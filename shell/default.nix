{pkgs, ...}: {
  imports = [
    ./shells/fish
    ./shells/zsh
    ./tools/atuin.nix
    ./tools/yazi
    ./terminals/foot.nix
    ./terminals/kitty.nix
  ];
  programs = {
    starship.enable = true;
    zoxide.enable = true;
    nix-index.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
