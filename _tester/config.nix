{
  self,
  inputs,
  lib,
  ...
}: let
  system = "x86_64-linux";
in {
  tester = lib.nixosSystem {
    inherit system;
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
