{ config, lib, ... }:
let
  cfg = config.homeModules.helix;
in
{
  options.homeModules.helix = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.helix = {
      enable = true;
    };
  };
}
