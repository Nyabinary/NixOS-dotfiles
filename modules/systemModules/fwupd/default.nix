{ config, lib, ... }:
let
  cfg = config.systemModules.fwupd;
in
{
  options.systemModules.fwupd = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    services.fwupd = {
      enable = true;
      extraRemotes = [ "lvfs-testing" ];
    };
  };
}
