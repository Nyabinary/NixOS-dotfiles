{ ... }:
{
  boot = {
    initrd = {
      systemd = {
        root = "gpt-auto";
        emergencyAccess = true;
      };
      supportedFilesystems = {
        btrfs = true;
        vfat = true;
      };
    };
  };
}
