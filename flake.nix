{
  description = "Home Dotfiles";

  outputs = {...}: {
    homeModules.packages = ./packages;
    homeModules.services = ./services;
    homeModules.shell = ./shell;
  };
}
