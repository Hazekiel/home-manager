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
    steam
    brightnessctl
    spotify
    hyprshot
    gparted
  ];
virtualisation.vmware.host.enable = true;
}
