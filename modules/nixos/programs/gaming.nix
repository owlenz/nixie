{
  flake-file.inputs.egs-flake = {
    url = "github:svin24/egs-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.nixos.gaming =
    { pkgs, ... }:
    {
      programs = {
        steam = {
          enable = true;
          dedicatedServer.openFirewall = true;
          localNetworkGameTransfers.openFirewall = true;
          gamescopeSession.enable = true;
          extraCompatPackages = with pkgs; [ proton-ge-bin ];
          extraPackages = with pkgs; [ gamemode ];
        };
        gamescope = {
          enable = true;
          capSysNice = true;
        };
        gamemode = {
          enable = true;
          settings = {
            general = {
              renice = 10;
              inhibit_screensaver = 0;
            };
            gpu = {
              apply_gpu_optimisations = "accept-responsibility";
              gpu_device = 0;
            };
            cpu = {
              park_cores = "no";
              pin_cores = "yes";
            };
          };
        };
      };
      environment.systemPackages = with pkgs; [
        # inputs.egs-flake.packages.${pkgs.system}.epic-games-launcher
        mangohud
        protonup-qt
        protontricks
        bottles
      ];
      # systemd.extraConfig = "DefaultLimitNOFILE=1048576";
      boot.kernel.sysctl = {
        "vm.swappiness" = 10;
        "kernel.sched_autogroup_enabled" = 0;
      };

      # hosting gaming
      # services.sunshine = {
      #   enable = true;
      #   autoStart = true;
      #   openFirewall = true;
      #   capSysAdmin = true;
      # };

      users.users.owlenz = {
        extraGroups = [
          "uinput"
          "gamemode"
        ];
      };
    };
}
