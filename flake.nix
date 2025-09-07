{
  description = "Home Default";

  outputs = {...}: {
    nixosModules.utils = ./utils.nix;
    nixosModules.hyprland = ./hyprland;
    nixosModules.packages = ./packages;
    nixosModules.shell = ./shell;
    nixosModules.services = ./services;
  };
}
