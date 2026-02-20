{
  description = "Home Dotfiles";

  outputs = inputs @ {import-tree, ...}: {
    homeModules = {
      packages = import-tree ./packages;
      services = import-tree ./services;
      shell = import-tree ./shell;
    };
  };
}
