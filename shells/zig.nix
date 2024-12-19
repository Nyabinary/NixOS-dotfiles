{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    yafas = {
      url = "github:UbiqueLambda/yafas";
    };
    zig = {
      url = "github:mitchellh/zig-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      yafas,
      zig,
      ...
    }:
    yafas.allSystems nixpkgs (
      { pkgs, system }:
      {
        formatter = pkgs.nixfmt-rfc-style;
        devShell = pkgs.mkShell { buildInputs = [ zig.packages.${system}.master ]; };
      }
    );
}
