{ config, lib, ... }:
let
  cfg = config.systemModules.networking;
in
{
  options.systemModules.networking = {
    enable = lib.mkEnableOption "";
    locale = lib.mkOption {
      default = "";
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    networking = {
      hostName = cfg.locale;
      networkmanager = {
        enable = true;
        wifi = {
          backend = "iwd";
          macAddress = "random";
        };
      };
      wireless = {
        enable = false;
        iwd = {
          enable = true;
          settings = {
            Settings = {
              AlwaysRandomizeAddress = true;
            };
          };
        };
      };
      firewall = {
        enable = true;
        filterForward = true;
      };
      nftables = {
        enable = true;
      };
    };
  };
}
