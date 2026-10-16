{ config, ... }:
{
  flake.modules.nixos.hardware =
    { ... }:
    {
      imports = [
        config.flake.modules.nixos.bluetooth
        config.flake.modules.nixos.udev
        config.flake.modules.nixos.battery
      ];
    };
}
