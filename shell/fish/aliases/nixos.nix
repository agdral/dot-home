{...}: {
  programs.fish.functions = {
    f-all = "cd /etc/nixos/ && nix-channel --update && sudo nix flake update";
    f-nixvim = "cd /etc/nixos/ && sudo nix flake lock --update-input nixvim-config";
    f-nixos = "cd /etc/nixos/ && sudo nix flake lock --update-input dotfile-default";
    s-nixos = "f-nixos && f-nixvim && sudo nixos-rebuild switch --upgrade";
    s-home = "home-manager switch";
    s-boot = "sudo nixos-rebuild boot";
    rm-nixos = "sudo nix-collect-garbage -d";
    rm-home = "home-manager expire-generations '-0 days'";
  };
}
