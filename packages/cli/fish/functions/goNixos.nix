{...}: {
  programs.fish.functions = {
    n-nixos = ''
      "sudo nvim /etc/nixos/"
    '';
    n-flake = ''
      set path_p /etc/nixos/
      set edit_p "flake.nix"
      handle_if $argv[1] $path_p $edit_p
    '';
    n-serv = ''
      set edit_p "default/services.nix"
      handle_if $argv[1] $path_nixos $edit_p
    '';
    n-pack = ''
      set edit_p "default/packages.nix"
      handle_if $argv[1] $path_nixos $edit_p
    '';
    n-boot = ''
      set edit_p "default/boot.nix"
      handle_if $argv[1] $path_nixos $edit_p
    '';
    n-nixvim = ''
      set path_p (zoxide query Nixvim-Config)
      set edit_p "config.nix"
      handle_if $argv[1] $path_p $edit_p
    '';
    n-k530 = ''
      set path_p (zoxide query OwnGithub/k530)
      set edit_p "keymaps/default/keymap.c"
      handle_if $argv[1] $path_p $edit_p
    '';
    n-k630 = ''
      set path_p (zoxide query OwnGithub/k630)
      set edit_p "keymaps/default/keymap.c"
      handle_if $argv[1] $path_p $edit_p
    '';
  };
}

