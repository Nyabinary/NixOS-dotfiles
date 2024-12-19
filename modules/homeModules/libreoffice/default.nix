{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.homeModules.libreoffice;
in
{
  options.homeModules.libreoffice = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable { home.packages = [ pkgs.libreoffice-fresh ]; };
}
