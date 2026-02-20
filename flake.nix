{
  description = "Home Dotfiles";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
  };

  outputs = {
    nixpkgs,
    import-tree,
    ...
  }: let
    lib = nixpkgs.lib;
  in {
    homeModules = {
      packages = import-tree.filter (lib.hasSuffix "/default.nix") ./packages;
      services = import-tree.filter (lib.hasSuffix "/default.nix") ./services;
      shell = import-tree.filter (lib.hasSuffix "/default.nix") ./shell;
    };
  };
}
