{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    yafas = {
      url = "github:UbiqueLambda/yafas";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      yafas,
      fenix,
      ...
    }:
    yafas.allSystems nixpkgs (
      { pkgs, system }:
      {
        formatter = pkgs.nixfmt-rfc-style;
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            lldb
            (fenix.packages.${system}.complete.withComponents [
              "cargo"
              "clippy"
              #"miri"
              "rust-analyzer"
              #"rust-docs"
              "rust-src"
              "rust-std"
              "rustc"
              "rustfmt"
            ])
          ];
        };
      }
    );
}
