{
  description = "Home Dotfiles";

  outputs = {
    lib,
    import-tree,
    ...
  }: {
    homeModules = {
      packages = import-tree.filter (lib.hasSuffix "/default.nix") ./packages;
      services = import-tree.filter (lib.hasSuffix "/default.nix") ./services;
      shell = import-tree.filter (lib.hasSuffix "/default.nix") ./shell;
    };
  };
}
