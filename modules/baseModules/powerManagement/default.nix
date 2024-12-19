{ config, lib, ... }:
let
  cfg = config.baseModules.powerManagement;
in
{
  options.baseModules.powerManagement = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    powerManagement = {
      enable = true;
    };
  };
}
