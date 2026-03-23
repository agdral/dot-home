{
  description = "Home Dotfiles";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dot-home = {
      url = "github:agdral/dot-home";
      inputs.import-tree.follows = "import-tree";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    dot-home,
    ...
  }: let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        home-manager.nixosModules.home-manager

        {
          boot.loader.grub.enable = false;
          fileSystems."/" = {device = "/dev/null";};
          system.stateVersion = "26.05";

          users.users.tester = {
            isNormalUser = true;
          };

          home-manager.users.tester = {
            imports = [
              dot-home.homeModules.packages
              dot-home.homeModules.services
              dot-home.homeModules.shell
              {
                dotPack = {
                  apps = true;
                  firefox = true;
                  neovide = true;
                  proton = true;
                  qmk = true;
                  tidal = true;
                };
                dotServ = {
                  openTablet = true;
                  wlsunset = true;
                };
                dotShell = {
                  apps = true;
                  atuin = true;
                  btop = true;
                  direnv = true;
                  fish = true;
                  gitui = true;
                  kitty = true;
                  payRespect = true;
                  starship = true;
                  yazi = true;
                  zsh = true;
                };
              }
            ];

            home = {
              stateVersion = "26.05";
            };
          };
        }
      ];
    };
  };
}
