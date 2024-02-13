{ config, pkgs, stablepkgs, ...}:

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
  };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    prime = {
      reverseSync.enable = true; 
      # sync = {
      #  enable = true;
      # };
      offload = {
        # enable =  true;
        enableOffloadCmd = true; # Provides `nvidia-offload` command.
      };
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:65:0:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  boot = {
    extraModulePackages = [ config.boot.kernelPackages.nvidiaPackages.stable ];
  };
}