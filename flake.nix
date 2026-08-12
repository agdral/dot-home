{
  description = "Home Dotfiles";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    nixstable.url = "https://flakehub.com/f/NixOS/nixpkgs/*";

    import-tree.url = "github:vic/import-tree";
    joinix.url = "github:agdral/joinix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
    joinix,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs-stable = import inputs.nixstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    homeModules.default = {
      _module.args = {inherit firefox-addons pkgs-stable joinix;};
      imports = [
        (import-tree.filter (lib.hasSuffix "/default.nix") ./customs)
        (import-tree.filter (lib.hasSuffix "/default.nix") ./packages)
        (import-tree.filter (lib.hasSuffix "/default.nix") ./services)
        (import-tree.filter (lib.hasSuffix "/default.nix") ./shell)
      ];
    };

    nixosConfigurations = import _tester/config.nix {
      inherit self inputs lib;
    };
  };
}
