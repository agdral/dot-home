{
  description = "Home Default";

  outputs = {...}: {
    homeModules.packages = ./packages;
    homeModules.services = ./services;
    homeModules.shell = ./shell;
  };
}
