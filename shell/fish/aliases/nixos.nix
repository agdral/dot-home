{...}: {
  programs.fish.functions = {
    f-all = "cd /etc/nixos/ && sudo nix flake update";
    f-one = "cd /etc/nixos/ && sudo nix flake lock update $argv";
    sudup = "sudo nixos-rebuild switch --upgrade";
    suboot = "sudo nixos-rebuild boot";
    surmg = "sudo nix-collect-garbage -d";
  };
}
