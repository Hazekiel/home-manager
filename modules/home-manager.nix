{ inputs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = ".backup";
    users = { ambrozic = import ./../users/ambrozic.nix; };
  };

}
