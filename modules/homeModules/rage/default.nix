{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.homeModules.rage;
in
{
  options.homeModules.rage = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable { home.packages = with pkgs; [ rage ]; };
}
