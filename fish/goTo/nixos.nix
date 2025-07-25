{...}: {
  programs.fish.functions = {
    n-nixos = ''
      "sudo nvim /etc/nixos/"
    '';
    n-flake = ''
      handle_if $argv[1] $path_nixos "flake.nix"
    '';
    n-serv = ''
      handle_if $argv[1] $path_nixos"/Dotfile-Default/" "services.nix"
    '';
    n-pack = ''
      handle_if $argv[1] $path_nixos"/Dotfile-Default/" "packages.nix"
    '';
    n-boot = ''
      handle_if $argv[1] $path_nixos"/Dotfile-Default/" "boot.nix" 
    '';
    n-nixvim = ''
      handle_if $argv[1] $path_nixos"/Nixvim-Config/" "config.nix" 
    '';
  };
}

