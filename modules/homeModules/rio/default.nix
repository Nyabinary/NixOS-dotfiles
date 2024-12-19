{ config, lib, ... }:
let
  cfg = config.homeModules.rio;
in
{
  options.homeModules.rio = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.rio = {
      enable = true;
    };
  };
}
