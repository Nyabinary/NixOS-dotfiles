{ config, lib, ... }:
let
  cfg = config.homeModules.xdg;
in
{
  options.homeModules.xdg = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    xdg = {
      enable = true;
      mime = {
        enable = true;
      };
      mimeApps = {
        enable = true;
      };
      portal = {
        enable = true;
      };
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
    home = {
      preferXdgDirectories = true;
    };
  };
}
