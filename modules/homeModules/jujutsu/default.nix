{ config, lib, ... }:
let
  cfg = config.homeModules.jujutsu;
in
{
  options.homeModules.jujutsu = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.jujutsu = {
      enable = true;
    };
  };
}
