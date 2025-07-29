{pkgs, ...}: {
  imports = [
    ./interfaces.nix
    ./packages.nix
    ./hyprland
    ./shell

    # Cli
    ./packages/cli/btop.nix
    ./packages/cli/git.nix
    ./packages/cli/gitui.nix
    ./packages/cli/tridactyl

    # Gui
    ./packages/gui_tui/neovide.nix
    ./packages/gui_tui/proton.nix
    ./packages/gui_tui/walker
    ./packages/gui_tui/waybar
    ./packages/gui_tui/firefox
    ./packages/gui_tui/swaync

    # Services
    ./packages/service/espanso.nix
    ./packages/service/swww.nix
    ./packages/service/syncthing.nix
  ];
}
