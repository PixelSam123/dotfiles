{
  networking.hostName = "sam-nixos-vmware"; # Define your hostname.

  # Use vmware video driver
  services.xserver.videoDrivers = [ "vmware" ];

  # Enable the VMWare Guest Agent.
  virtualisation.vmware.guest.enable = true;
}
