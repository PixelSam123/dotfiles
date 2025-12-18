{
  description = "Sam's NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      sam-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware-configurations/virt-manager.nix
          ./per-instance/virt-manager.nix
          ./configuration.nix
        ];
      };
      sam-nixos-vmware = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware-configurations/vmware.nix
          ./per-instance/vmware.nix
          ./configuration.nix
        ];
      };
      sam-nixos-b460 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware-configurations/b460.nix
          ./per-instance/b460.nix
          ./configuration.nix
        ];
      };
    };
  };
}
