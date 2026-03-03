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


  programs.direnv.enable = true;

  environment.systemPackages = with pkgs; [
    nixfmt
    brightnessctl
    unzip
    unrar
    p7zip
    btop
    gparted
    borgbackup
    #exegol
    pkgs.python315
    hashcat
    burpsuite
    libreoffice-qt-fresh
    hyprshot
    firefox
    vscode
    discord
    keepassxc
    obsidian
    spotify
    gimp
    lunar-client
    prismlauncher
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.lilex
  ];
  virtualisation.vmware.host.enable = true;
  virtualisation.docker.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  programs.steam.enable = true;
}
