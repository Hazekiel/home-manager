{ pkgs, ... }: {
  imports = [ ./hyprland.nix ];

  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };
  console.useXkbConfig = true;

  environment.systemPackages = with pkgs; [
    nixfmt
    vscode
    firefox

  ];

}
