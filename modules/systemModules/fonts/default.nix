{ config, lib, ... }:
let
  cfg = config.systemModules.fonts;
in
{
  options.systemModules.fonts = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    fonts = {
      fontconfig = {
        enable = true;
      };
      enableDefaultPackages = true;
    };
  };
}
