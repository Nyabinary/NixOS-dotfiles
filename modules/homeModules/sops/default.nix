{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.homeModules.sops;
in
{
  options.homeModules.sops = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable { home.packages = with pkgs; [ sops ]; };
}
