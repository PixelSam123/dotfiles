{
  networking.hostName = "sam-nixos"; # Define your hostname.

  # Enable the QEMU Guest Agent.
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
}
