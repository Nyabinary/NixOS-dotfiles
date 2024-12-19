{ config, lib, ... }:
let
  cfg = config.baseModules.sudo;
in
{
  options.baseModules.sudo = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    security.sudo-rs = {
      enable = true;
    };
  };
}
