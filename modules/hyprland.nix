{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ kitty swww rofi xarchiver ];
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  services.greetd = {
    enable = true;
    settings.default_session = {
      command =
        "${pkgs.greetd.tuigreet}/bin/tuigreet --time -r --asterisks --user-menu --cmd Hyprland";
      user = "greeter";
    };
  };
}
