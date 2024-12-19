{ config, lib, ... }:
let
  cfg = config.baseModules.udev;
in
{
  options.baseModules.udev = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    services.udev = {
      enable = true;
    };
  };
}
