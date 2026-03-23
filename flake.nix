{
  description = "Home Dotfiles";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Tester Modules
    nixstable.url = "https://flakehub.com/f/NixOS/nixpkgs/*";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dot-nixos = {
      url = "github:agdral/dot-nixos";
      inputs.import-tree.follows = "import-tree";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixstable.follows = "nixstable";
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
    tools = import inputs.dot-nixos.nixosModules.tools;
  in {
    homeModules.packages = {
      _module.args = {
        inherit firefox-addons pkgs-stable tools;
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
