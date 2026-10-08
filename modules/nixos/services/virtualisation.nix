{
  flake.modules.nixos.virt =
    {
      config,
      ...
    }:
    {
      #hardware.nvidia-container-toolkit.enable = true;
      # port forwarding
      boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
      virtualisation = {
        # lxc.enable = true;
        podman = {
          enable = true;
        };
        docker = {
          enable = true;
          # rootless = {
          #   enable = true;
          #   setSocketVariable = true;
          # };

          daemon.settings = {
            features.cdi = true;
            dns = [
              "1.1.1.1"
              "8.8.8.8"
            ];
            registry-mirrors = [ "https://mirror.gcr.io" ];
          };
        };
      };

      containers.test = {
        autoStart = false;
        bindMounts."/code/devops" = {
          hostPath = "${config.users.users.owlenz.home}/code/devops";
          isReadOnly = false;
        };
        privateNetwork = true;
        hostAddress = "192.168.100.10";
        localAddress = "192.168.100.11";
        config = { pkgs, ... }: {
          system.stateVersion = "26.05";
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
            initialPassword = "changeme";
          };

          networking.firewall.allowedTCPPorts = [
            80
            443
          ];
          environment.systemPackages = [
            pkgs.caddy
            pkgs.go
            pkgs.vim
            pkgs.gopls
          ];
        };

      };

      users.users.owlenz = {
        extraGroups = [
          "docker"
          "podman"
        ];
      };
    };
}
