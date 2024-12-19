{ config, lib, ... }:
let
  cfg = config.baseModules.systemd;
in
{
  options.baseModules.systemd = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    systemd = {
      enableCgroupAccounting = true;
      enableEmergencyMode = true;
      oomd = {
        enable = true;
        enableRootSlice = true;
        enableSystemSlice = true;
        enableUserSlices = true;
      };
    };
  };
}
