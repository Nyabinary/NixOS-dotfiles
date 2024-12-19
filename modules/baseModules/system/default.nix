{
  config,
  lib,
  version,
  ...
}:
let
  cfg = config.baseModules.system;
in
{
  options.baseModules.system = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    system = {
      #etc = {
      #  overlay = {
      #    enable = true;
      #    mutable = false;
      #  };
      #};
      rebuild = {
        enableNg = true;
      };
      stateVersion = version;
    };
    services = {
      userborn = {
        enable = true;
      };
    };
    zramSwap = {
      enable = true;
    };
  };
}
