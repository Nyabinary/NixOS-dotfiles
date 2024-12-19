{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.homeModules.firefox;
in
{
  options.homeModules.firefox = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      package = pkgs.firefox_nightly;
      enable = true;
    };
  };
}
