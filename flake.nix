{
  description = "NixOS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";

  };

  outputs = { nixpkgs, home-manager, stylix, ... }@inputs: {

    homeConfigurations.ambrozic = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = { allowUnfree = true; };
      };
      modules = [ inputs.stylix.homeModules.stylix ./users/ambrozic.nix ];
    };

    nixosConfigurations.sam = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules =
        [ ./hosts/sam/configuration.nix inputs.stylix.nixosModules.stylix ];
    };
  };
}
