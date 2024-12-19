{ config, lib, ... }:
let
  cfg = config.homeModules.direnv;
in
{
  options.homeModules.direnv = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
      silent = true;
    };
  };
}
