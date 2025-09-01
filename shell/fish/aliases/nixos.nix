{
  programs.fish = {
    shellAbbrs = {
      f-all = "cd /etc/nixos/ && sudo nix flake update";
      sudup = "sudo nixos-rebuild switch";
      suboot = "sudo nixos-rebuild boot";
      surmg = "sudo nix-collect-garbage -d";
      suf = "sudo su -s $(which fish)";
      suans = "su - ansible -s $(which fish)";
    };
    functions = {
      sutup = ''
        cd /etc/nixos/
        sudo nix flake update dotfile-default
        sudo nix flake update home-default
        sudo nix flake update nixvim-config
        sudo nixos-rebuild switch
      '';
      f-one = "cd /etc/nixos/ && sudo nix flake lock update $argv";
      nixp = "nix-shell --run fish -p $argv";
    };
  };
}
