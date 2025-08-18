{...}: {
  programs.fish.functions = {
    f-all = "cd /etc/nixos/ && sudo nix flake update";
    f-one = "cd /etc/nixos/ && sudo nix flake lock update $argv";
    sutup = ''
      cd /etc/nixos/
      sudo nix flake update dotfile-default
      sudo nix flake update home-default
      sudo nix flake update nixvim-config
      sudo nixos-rebuild switch
    '';
    sudup = "sudo nixos-rebuild switch";
    suboot = "sudo nixos-rebuild boot";
    surmg = "sudo nix-collect-garbage -d";
  };
}
