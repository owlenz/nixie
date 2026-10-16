{ config, ... }:
let
  nixosModules = config.flake.modules.nixos;
in
{
  flake.modules.nixos.graphics-common =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.btop
      ]
      ++ (with pkgs.gst_all_1; [
        gstreamer
        gst-plugins-base
        gst-plugins-good
        gst-plugins-bad
        gst-plugins-ugly
        gst-libav
      ]);
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  flake.modules.nixos.graphics-nvidia =
    { pkgs, config, ... }:
    {
      imports = [
        nixosModules.graphics-common
      ];
      environment.variables.LIBVA_DRIVER_NAME = "nvidia";
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.graphics.extraPackages = [ pkgs.nvidia-vaapi-driver ];
      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    };
  flake.modules.nixos.graphics-amd =
    { pkgs, ... }:
    {
      imports = [
        nixosModules.graphics-common
      ];
      boot.initrd.kernelModules = [ "amdgpu" ];
      services.xserver.videoDrivers = [ "amdgpu" ];
      hardware.graphics.extraPackages = [ pkgs.rocmPackages.clr.icd ];
      users.users.owlenz.extraGroups = [
        "video"
        "render"
      ];
      environment.systemPackages = [
        pkgs.rocmPackages.rocminfo
        pkgs.rocmPackages.rocm-smi
      ];
    };
}
