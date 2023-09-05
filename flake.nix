{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    mozilla = {
      url = "github:colemickens/flake-firefox-nightly";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixos-hardware,
    mozilla,
    ...
  } @ inputs: let
    createSystem = {
      name,
      config,
      home,
      system,
    }: let
      version = "23.11";
    in
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs name version;
        };
        modules = [
          config
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {
                inherit inputs name version; #TODO (MAKE PRETTIER)
              };
              useGlobalPkgs = true;
              users.${name} = {
                imports = [home];
                home.stateVersion = version;
              };
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      "binary" = createSystem {
        name = "binary";
        config = ./hosts/binary/configuration.nix;
        home = ./hosts/binary/home.nix;
        system = ./hosts/binary/system.nix;
      };
    };
  };
}
