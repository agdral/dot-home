{pkgs, ...}: {
  imports = [
    ./interfaces.nix
    ./packages.nix

    # individual
    ./hyprland
    ./fish
    ./yazi

    # Services
    ./packages/service/espanso.nix
    ./packages/service/hyprPolkit.nix
    ./packages/service/pyprland.nix
    ./packages/service/swww.nix
    ./packages/service/syncthing.nix

    # Gui
    ./packages/gui/foot.nix
    ./packages/gui/kitty.nix
    ./packages/gui/neovide.nix
    ./packages/gui/proton.nix

    # Cli
    ./packages/cli/atuin.nix
    ./packages/cli/zsh.nix
    ./packages/cli/btop.nix
    ./packages/cli/git.nix
    ./packages/cli/gitui.nix

    # Dotfis
    ./packages/dotfis/walker.nix
    ./packages/dotfis/waybar.nix
    ./packages/dotfis/swaync.nix
    ./packages/dotfis/firefox.nix
    ./packages/dotfis/tridactyl.nix
  ];
}
