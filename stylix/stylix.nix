{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    polarity = "dark";
    icons = {
      enable = true;
      package = pkgs.kdePackages.breeze-icons;
      light = "breeze";
      dark = "breeze-dark";
    };
    opacity = {
      terminal = 0.1;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans ";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif ";
      };

    };
  };
}
