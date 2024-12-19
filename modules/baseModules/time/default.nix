{ config, lib, ... }:
let
  cfg = config.baseModules.time;
in
{
  options.baseModules.time = {
    enable = lib.mkEnableOption "";
    locale = lib.mkOption {
      default = "America/New_York";
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    time = {
      timeZone = cfg.locale;
      hardwareClockInLocalTime = false;
    };
  };
}
