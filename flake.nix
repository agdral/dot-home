{
  description = "Home Dotfiles";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
    joinix.url = "github:agdral/joinix";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixstable.url = "https://flakehub.com/f/NixOS/nixpkgs/*";

    # Tester Modules
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    import-tree,
    firefox-addons,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs-stable = import inputs.nixstable {
      inherit system;
      config.allowUnfree = true;
    };
    joinix = import inputs.joinix.homeModules.default;
  in {
    homeModules.packages = {
      _module.args = {
        inherit firefox-addons pkgs-stable joinix;
      };
      imports = [
        (import-tree.filter (lib.hasSuffix "/default.nix") ./packages)
      ];
    };
    homeModules.services = import-tree.filter (lib.hasSuffix "/default.nix") ./services;
    homeModules.shell = import-tree.filter (lib.hasSuffix "/default.nix") ./shell;

    nixosConfigurations = import _tester/config.nix {
      inherit self inputs lib;
    };
  };
}
