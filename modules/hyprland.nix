{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kitty
    hyprpaper
    xarchiver
    blueman
    libsecret
    hyprpolkitagent
    rofi
  ];
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  programs.xfconf.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
    services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time -r --asterisks --user-menu --cmd Hyprland";
      user = "greeter";
    };
  };
  services.blueman.enable = true;
  environment.variables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
  };
  services.upower.enable = true;
}
