{
  lib,
  config,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ehci_pci"
    "ahci"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/8663f64a-7405-45a6-9f75-7790af5947ec";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DD4D-FBB3";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/bbb6c65e-1461-4c73-90b7-adb024a30268";
    fsType = "ext4";
  };

  fileSystems."/mnt/mark-I" = {
    device = "/dev/disk/by-uuid/cc10bdbf-348c-4330-aa4b-6c024099ab0e";
    fsType = "ext4";
  };

  fileSystems."/mnt/mark-II" = {
    device = "/dev/disk/by-uuid/d68514ab-294a-4d5a-aefc-35b34c1243f6";
    fsType = "ext4";
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/5879dcbb-6541-4139-8d49-f0ba49d2864a";
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    graphics.enable = true;
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
