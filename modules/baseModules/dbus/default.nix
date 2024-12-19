{ config, lib, ... }:
let
  cfg = config.baseModules.dbus;
in
{
  options.baseModules.dbus = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    services = {
      dbus = {
        enable = true;
        implementation = "broker";
      };
    };
  };
}
