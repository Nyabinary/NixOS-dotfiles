{ config, lib, ... }:
let
  cfg = config.homeModules.git;
in
{
  options.homeModules.git = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      extraConfig = {
        "init" = {
          defaultBranch = "main";
        };
        "push" = {
          autoSetupRemote = true;
        };
      };
    };
  };
}
