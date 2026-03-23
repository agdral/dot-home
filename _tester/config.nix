{
  self,
  inputs,
  lib,
  ...
}: let
  system = "x86_64-linux";
  tools = import inputs.dot-nixos.nixosModules.tools;

  pkgs-stable = import inputs.nixstable {
    inherit system;
    config.allowUnfree = true;
  };
in {
  tester = lib.nixosSystem {
    inherit system;
    specialArgs =
      inputs
      // {
        inherit inputs tools pkgs-stable;
      };
    modules = [
      inputs.home-manager.nixosModules.home-manager

      {
        nixpkgs.config.allowUnfree = true;
        boot.loader.grub.enable = false;
        fileSystems."/" = {device = "/dev/null";};
        system.stateVersion = "26.05";

        users.users.tester = {
          isNormalUser = true;
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs =
            inputs
            // {
              inherit pkgs-stable tools;
            };
        };
        home-manager.users.tester = {
          imports = [
            self.homeModules.packages
            self.homeModules.services
            self.homeModules.shell
            ./settings.nix
          ];

          home = {
            stateVersion = "26.05";
          };
        };
      }
    ];
  };
}
