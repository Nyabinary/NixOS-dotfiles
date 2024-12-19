{ config, lib, ... }:
let
  cfg = config.homeModules.gpg;
in
{
  options.homeModules.gpg = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.gpg = {
      enable = true;
      mutableKeys = false;
      mutableTrust = false;
    };
  };
}
