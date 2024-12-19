{ ... }:
{
  services.udev = {
    extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="fedd", MODE="666"
      SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="a291", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="df11", TAG+="uaccess"
    '';
  };
}
