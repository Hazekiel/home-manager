{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./nh.nix
  ];

  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };
  console.useXkbConfig = true;

  environment.systemPackages = with pkgs; [
    nixfmt
    vscode
    firefox
    discord
    keepassxc
    obsidian
    brightnessctl
    spotify
    hyprshot
    gparted
    borgbackup
    exegol
    burpsuite
    cool-retro-term
    btop
    gimp
    unzip 
  ];
virtualisation.vmware.host.enable = true;
virtualisation.docker.enable = true;
systemd.services.NetworkManager-wait-online.enable = false;
programs.steam.enable = true;
}
