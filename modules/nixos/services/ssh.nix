{
  flake.modules.nixos.ssh =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.openssl ];
      services.openssh = {
        enable = true;
        ports = [ 22 ];
        settings = {
          PasswordAuthentication = true;
          AllowUsers = null;
          UseDns = true;
          X11Forwarding = false;
          PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
        };
      };
    };
}
