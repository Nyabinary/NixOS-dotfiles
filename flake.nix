{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic-nyx = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    {
      nixpkgs,
      nixos-hardware,
      home-manager,
      sops-nix,
      chaotic-nyx,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      nixos-hardware = inputs.nixos-hardware.nixosModules;
      home-manager = inputs.home-manager.nixosModules.home-manager;
      sops-nix = inputs.sops-nix.nixosModules.sops;
      chaotic-nyx = inputs.chaotic-nyx.nixosModules.default;
      createSystem =
        {
          name,
          config,
          base,
          home,
          system,
          extraModules,
        }:
        let
          version = "25.05";
          specialArgs = {
            inherit
              inputs
              system
              version
              name
              ;
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          modules = [
            base
            system
            config
            home-manager
            sops-nix
            chaotic-nyx
            {
              imports = [ ./cachix.nix ];
              home-manager = {
                backupFileExtension = "bak";
                extraSpecialArgs = specialArgs;
                users.${name} = {
                  imports = [ home ];
                  home.stateVersion = version;
                };
                useGlobalPkgs = true;
                useUserPackages = true;
              };
            }
          ] ++ extraModules;
        };
    in
    {
      # Set default formatter for `nix fmt`
      formatter.${system} = pkgs.nixfmt-rfc-style;
      # Declare system configurations
      nixosConfigurations = {
        "nyan" = createSystem {
          name = "binary";
          config = ./hosts/nyan/configuration.nix;
          base = ./hosts/nyan/base.nix;
          home = ./hosts/nyan/home.nix;
          system = ./hosts/nyan/system.nix;
          extraModules = [ nixos-hardware.framework-13-7040-amd ];
        };
        "binary" = createSystem {
          name = "nyan";
          config = ./hosts/binary/configuration.nix;
          base = ./hosts/binary/base.nix;
          home = ./hosts/binary/home.nix;
          system = ./hosts/binary/system.nix;
          extraModules = [ nixos-hardware.framework-16-7040-amd ];
        };
      };
    };
}
