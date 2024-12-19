{ config, lib, ... }:
let
  cfg = config.systemModules.flatpak;
in
{
  options.systemModules.flatpak = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = true;
    };
  };
}
