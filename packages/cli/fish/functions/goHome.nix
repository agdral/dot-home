{...}: {
  programs.fish.functions = {
    h-fish = ''
      set edit_p "default.nix"
      handle_if $argv[1] $path_home"/individual/cli/fish/" $edit_p
    '';
    h-yazi = ''
      set edit_p "settings.nix"
      handle_if $argv[1] $path_home"/individual/cli/yazi/" $edit_p
    '';
    h-firefox = ''
      set edit_p "default.nix"
      handle_if $argv[1] $path_home"/individual/gui/firefox/" $edit_p
    '';
    h-script = ''
      set edit_p "settings.nix"
      handle_if $argv[1] $path_home"/dotfiles/" $edit_p
    '';
    h-home = ''
      set edit_p "home.nix"
      handle_if $argv[1] $path_home $edit_p
    '';
    h-pack = ''
      set edit_p "packages.nix"
      handle_if $argv[1] $path_home $edit_p
    '';
    h-share = ''
      set edit_p "sharePack.nix"
      handle_if $argv[1] $path_home $edit_p
    '';
    h-system = ''
      set edit_p "systemctl.nix"
      handle_if $argv[1] $path_home $edit_p
    '';
    h-hypr = ''
      set edit_p "app.nix"
      handle_if $argv[1] $path_home"/individual/hyprland/default/" $edit_p
    '';
  };
}
