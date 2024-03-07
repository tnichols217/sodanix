{ config, pkgs, stablepkgs, lib, ...}:

{  
  services = {
    xserver = {
      videoDrivers = [
        "amdgpu"
        "nvidia"
      ];
    };
    asusd = {
      enable = true; 
      enableUserService = true; 
    };
    # power 
    power-profiles-daemon.enable = true;
  };

  # hardware.amdgpu = {
  #   loadInInitrd = true;
  #   amdvlk = true;
  # };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    # powerManagement = {
      # enable = true;
      # finegrained = true; 
    # };
    prime = {
      # reverseSync.enable = true; 
      # sync = {
      #  enable = true;
      # };
      offload = {
        enable =  true;
        enableOffloadCmd = true;
      };
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:65:0:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  boot.kernelParams = [
    "amdgpu.gpu_recovery=1"
    "amdgpu.sg_display=0"
    "amdgpu.dcdebugmask=0x10"
    # "nouveau.config=NvGspRm=1"
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  powerManagement = {
    enable = true;
  };
}