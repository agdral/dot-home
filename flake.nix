{
  description = "Home Dotfiles";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    import-tree,
    firefox-addons,
    ...
  }: let
    lib = nixpkgs.lib;
  in {
    homeModules.packages = {
      _module.args = {
        inherit firefox-addons;
      };
      imports = [
        (import-tree.filter (lib.hasSuffix "/default.nix") ./packages)
      ];
    };
    homeModules.services = import-tree.filter (lib.hasSuffix "/default.nix") ./services;
    homeModules.shell = import-tree.filter (lib.hasSuffix "/default.nix") ./shell;
  };
}
