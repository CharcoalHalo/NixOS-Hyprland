{ config, lib, pkgs, ... }:
/*{
  services.xserver.videoDrivers = ["nvidia"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}*/
{
  # amd gpu
  boot.initrd.kernelModules = [ "amdgpu" ];

  # vulkan
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # offical amd drivers
  # hardware.opengl.extraPackages = with pkgs; [ amdvlk ];
  # hardware.opengl.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
}
