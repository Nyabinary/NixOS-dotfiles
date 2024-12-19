{ config, lib, ... }:
let
  cfg = config.systemModules.pipewire;
in
{
  options.systemModules.pipewire = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    hardware.pulseaudio.enable = false;
    # rtkit is optional but recommended
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      wireplumber.enable = true;
    };
  };
}
