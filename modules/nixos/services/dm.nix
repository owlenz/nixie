{
  flake.modules.nixos.dm =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        bitwarden-desktop
        polkit_gnome
      ];
      services.displayManager.ly.enable = false;

      services.xserver.displayManager.gdm = {
        enable = true;
      };

      services.fprintd.enable = true;

      security.pam.services = {
        # login.fprintAuth = true;
        sudo.fprintAuth = true;

        polkit-1 = {
          fprintAuth = true;
          u2fAuth = true;
        };

        noctalia = {
          fprintAuth = true;
          u2fAuth = true;
        };

        gdm-fingerprint.fprintAuth = true;
        gdm-password.u2fAuth = true;
      };

      security.pam.u2f = {
        enable = true;
        settings = {
          cue = true;
          authfile = "/etc/Yubico/u2f_keys";
        };
      };
    };
}
