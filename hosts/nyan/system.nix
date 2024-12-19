{ ... }:
{
  # Import system modules
  imports = [
    ./configs/systemConfigs
    ../../modules/systemModules
  ];

  # Configure system modules
  systemModules = {
    bluetooth.enable = true;
    flatpak.enable = true;
    fonts.enable = true;
    fwupd.enable = true;
    networking = {
      enable = true;
      locale = "nyan";
    };
    pipewire.enable = true;
    printing.enable = true;
  };
}
