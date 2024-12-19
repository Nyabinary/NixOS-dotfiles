{ config, lib, ... }:
let
  cfg = config.homeModules.gitui;
in
{
  options.homeModules.gitui = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.gitui = {
      enable = true;
    };
  };
}
