{
  description = "Home Default";

  outputs = {...}: {
    nixosModules.hyprland = ./hyprland;
    nixosModules.packages = ./packages;
    nixosModules.shell = ./shell;
    nixosModules.servicess = ./services;
  };
}
