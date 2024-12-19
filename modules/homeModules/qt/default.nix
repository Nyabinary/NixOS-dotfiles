{ config, lib, ... }:
let
  cfg = config.homeModules.qt;
in
{
  options.homeModules.qt = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    qt = {
      enable = true;
    };
  };
}
