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

  hardware.bluetooth.enable = true;

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
    #exegol
    burpsuite
    cool-retro-term
    btop
    gimp
    unzip
    lunar-client
    prismlauncher
    pkgs.python315
    hashcat
    libreoffice-qt-fresh
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.lilex
  ];
  #virtualisation.vmware.host.enable = true;
  virtualisation.docker.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  programs.steam.enable = true;
}
