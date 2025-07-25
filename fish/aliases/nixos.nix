{...}: {
  programs.fish.functions = {
    sudup = "sudo nixos-rebuild switch --upgrade --impure";
    suhome = "home-manager switch";
    suboot = "sudo nixos-rebuild boot --impure";
    surmg = "sudo nix-collect-garbage -d";
    hormg = "home-manager expire-generations '-0 days'";
    sunix = "cd /etc/nixos/ && nix-channel --update && sudo nix flake update --impure";
  };
}
