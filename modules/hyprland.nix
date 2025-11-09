{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kitty
    hyprpaper
    rofi
    xarchiver
    blueman
  ];
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  programs.thunar = {
    enable = true;
  };
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --asterisks --user-menu --cmd Hyprland";
      user = "greeter";
    };

  };
  services.blueman.enable = true;
  environment.variables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
  };
}
