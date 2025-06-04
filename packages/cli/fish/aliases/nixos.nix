{...}: {
  programs.fish.functions = {
    sudup = "sudo nixos-rebuild switch --upgrade --impure";
    suhome = "home-manager switch";
    suboot = "sudo nixos-rebuild boot --impure";
    surm = "sudo nix-collect-garbage";
    surmg = "sudo nix-collect-garbage -d";
    home-rm = "home-manager expire-generations '-0 days'";
    sunix = "cd /etc/nixos/ && nix-channel --update && sudo nix flake update --impure";
    m-kindle = "sudo mount -o uid=1000,gid=100 /dev/sdd /hdd/kindle/";
    u-kindle = "sudo umount -r /hdd/kindle/";
    m-usb = "sudo mount -o uid=1000,gid=100 $argv /hdd/usb/";
    walres = "systemctl restart --user walker.service";
  };
}
