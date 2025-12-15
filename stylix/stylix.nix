{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ./SBR_jojo.jpeg;
    polarity = "dark";
    icons = {
      enable = true;
      package = pkgs.kdePackages.breeze-icons;
      light = "breeze";
      dark = "breeze-dark";
    };
    opacity = {
      terminal = 0.95;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.lilex;
        name = "Lilex Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.lilex;
        name = "Lilex Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.lilex;
        name = "Lilex Nerd Font";
      };

    };
  };
}
