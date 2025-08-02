{
  description = "Home Default";

  outputs = {...}: {
    nixosModules.default = {...}: {
      imports = [
        ./interfaces.nix
        ./hyprland
        ./shell
        ./packages
        ./services
      ];
    };
  };
}
