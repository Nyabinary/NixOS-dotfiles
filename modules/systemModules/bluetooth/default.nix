{ config, lib, ... }:
let
  cfg = config.systemModules.bluetooth;
in
{
  options.systemModules.bluetooth = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    hardware = {
      bluetooth = {
        enable = true;
        settings = {
          General = {
            Experimental = true;
            KernelExperimental = true;
          };
        };
      };
    };
  };
}
