{
  description = "Sam's NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
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
    };
  };
}
