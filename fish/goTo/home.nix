{...}: {
  programs.fish.functions = {
    h-fish = ''
      handle_if $argv[1] $path_home"/Home-Default/fish/" "function.nix"
    '';
    h-yazi = ''
      handle_if $argv[1] $path_home"/Home-Default/yazi/" "settings.nix"
    '';
    h-firefox = ''
      handle_if $argv[1] $path_home"/Home-Default/dotfis/" "firefox.nix"
    '';
    h-scripts = ''
      handle_dir $argv[1] $path_home"/Home-Default/scripts/"
    '';
    h-home = ''
      handle_if $argv[1] $path_home "home.nix"
    '';
    h-pack = ''
      handle_if $argv[1] $path_home "packages.nix"
    '';
    h-share = ''
      handle_if $argv[1] $path_home"/Home-Default/" "default.nix"
    '';
    h-system = ''
      handle_if $argv[1] $path_home "systemctl.nix"
    '';
    h-hypr = ''
      handle_if $argv[1] $path_home"/Home-Default/hyprland/" "app.nix"
    '';
  };
}
