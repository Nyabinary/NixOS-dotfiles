{ config, lib, ... }:
let
  cfg = config.homeModules.gtk;
in
{
  options.homeModules.gtk = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
    };
  };
}
