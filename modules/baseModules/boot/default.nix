{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.baseModules.boot;
in
{
  options.baseModules.boot = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest; # Use latest stable Linux
      initrd = {
        systemd = {
          enable = true;
          strip = true;
        };
        verbose = true;
      };
      loader = {
        efi = {
          canTouchEfiVariables = true;
        };
        systemd-boot = {
          enable = true;
          editor = false;
        };
      };
      tmp = {
        useTmpfs = true;
        cleanOnBoot = true;
      };
    };
  };
}
