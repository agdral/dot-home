{
  description = "Home Dotfiles";

  outputs = {import-tree, ...}: {
    homeModules = {
      packages = import-tree ./packages;
      services = import-tree ./services;
      shell = import-tree ./shell;
    };
  };
}
