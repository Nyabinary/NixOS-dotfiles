{ ... }:
{
  # Import base modules
  imports = [
    ./configs/baseConfigs
    ../../modules/baseModules
  ];

  # Enable base modules
  baseModules = {
    boot.enable = true;
    dbus.enable = true;
    i18n.enable = true;
    nix.enable = true;
    powerManagement.enable = true;
    sudo.enable = true;
    system.enable = true;
    systemd.enable = true;
    time.enable = true;
    udev.enable = true;
    users.enable = true;
  };
}
