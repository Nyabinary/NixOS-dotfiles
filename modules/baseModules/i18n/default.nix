{ config, lib, ... }:
let
  cfg = config.baseModules.i18n;
in
{
  options.baseModules.i18n = {
    enable = lib.mkEnableOption "";
    locale = lib.mkOption {
      default = "en_US.UTF-8";
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    i18n = {
      defaultLocale = cfg.locale;
      extraLocaleSettings = {
        LC_ADDRESS = cfg.locale;
        LC_IDENTIFICATION = cfg.locale;
        LC_MEASUREMENT = cfg.locale;
        LC_MONETARY = cfg.locale;
        LC_NAME = cfg.locale;
        LC_NUMERIC = cfg.locale;
        LC_PAPER = cfg.locale;
        LC_TELEPHONE = cfg.locale;
        LC_TIME = cfg.locale;
      };
    };
  };
}
