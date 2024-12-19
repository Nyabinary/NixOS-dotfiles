{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.baseModules.nix;
in
{
  options.baseModules.nix = {
    enable = lib.mkEnableOption "";
  };
  # Nix specific settings
  config = lib.mkIf cfg.enable {
    nix = {
      package = pkgs.nixVersions.git;
      settings = {
        # See https://nixos.org/manual/nix/unstable/command-ref/conf-file.html
        # for a complete list of Nix configuration options.

        # 2024-07-24
        # https://github.com/NixOS/nix/blob/master/src/libutil/experimental-features.cc
        experimental-features = [
          "auto-allocate-uids"
          "ca-derivations"
          "cgroups"
          "configurable-impure-env"
          "daemon-trust-override"
          "dynamic-derivations"
          "fetch-closure"
          "fetch-tree"
          "flakes"
          "git-hashing"
          "impure-derivations"
          "local-overlay-store"
          "mounted-ssh-store"
          "nix-command"
          "no-url-literals"
          "parse-toml-timestamps"
          "pipe-operators"
          "read-only-local-store"
          "recursive-nix"
          "verified-fetches"
        ];
        auto-allocate-uids = true;
        auto-optimise-store = true;
        fsync-store-paths = true;
        keep-build-log = false;
        keep-derivations = false;
        keep-outputs = false;
        pure-eval = false;
        sandbox = true;
        use-cgroups = true;
        use-xdg-base-directories = true;
      };
      optimise = {
        automatic = true;
      };
      sshServe = {
        protocol = "ssh-ng";
      };
      channel = {
        enable = false;
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
        persistent = true;
      };
    };
    # Configure nixpkgs
    nixpkgs = {
      config = {
        allowAliases = false;
        allowUnfree = true;
      };
      flake = {
        setNixPath = true;
        setFlakeRegistry = true;
      };
    };
  };
}
