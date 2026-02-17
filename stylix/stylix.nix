{ pkgs, ... }:
{
  stylix = {
    enable = true;
    image = ./SBR_horse.jpg;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/hardhacker.yaml";

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
