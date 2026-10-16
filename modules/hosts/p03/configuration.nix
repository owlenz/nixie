{ config, ... }: {
  flake.modules.nixos.p03Configuration =
    { pkgs, ... }:
    {
      boot.loader = {
        systemd-boot.enable = true;
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
      };

      networking.hostName = "p03";
      time.timeZone = "Africa/Cairo";

      programs.zsh.enable = true;

      users.users.owlenz = {
        isNormalUser = true;
        home = "/home/owlenz";
        shell = pkgs.zsh;
        description = "owlenz main user";
        extraGroups = [
          "networkmanager"
          "wheel"
          "audio"
          "media"
        ];
      };
      users.groups.media = { };

      networking.networkmanager.enable = true;
      systemd.services.systemd-networkd-wait-online.enable = true;

      i18n.defaultLocale = "en_US.UTF-8";
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
      };

      environment.systemPackages = with pkgs; [
        vim
        curl
        wget
      ];
      networking.firewall.enable = false;
      nixpkgs.config.allowUnfree = true;
      system.stateVersion = "26.05";

      imports = [
        config.flake.modules.nixos.root
        config.flake.modules.nixos.graphics-amd
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
}
