{pkgs, ...}: {
  imports = [
    ./shells/fish
    ./shells/zsh
    ./terminals/foot.nix
    ./terminals/kitty.nix

    ./tools/yazi
    ./tools/atuin.nix
    ./tools/btop.nix
    ./tools/gitui.nix
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
