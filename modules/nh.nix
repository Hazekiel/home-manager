{
  pkgs,
  lib,
  ...
}:
{
  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep-since 2d --keep 3";
    };
  };
  systemd.services.nh-clean.serviceConfig.Type = lib.mkForce "simple";
}
