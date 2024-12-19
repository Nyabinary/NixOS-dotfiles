{ pkgs, ... }:
{
  services.printing = {
    drivers = [ pkgs.hplipWithPlugin ];
  };
  hardware.printers = {
    ensureDefaultPrinter = "HP_Color_LaserJet_Pro_MFP_M477fnw";
    ensurePrinters = [
      {
        name = "HP_Color_LaserJet_Pro_MFP_M477fnw";
        location = "Office";
        deviceUri = "dnssd://HP%20Color%20LaserJet%20MFP%20M477fnw._ipp._tcp.local/?uuid=564e434b-4d31-4b4a-5630-b00cd126b0a1";
        description = "HP Color LaserJet Pro MFP M477fnw";
        model = "HP/hp-color_laserjet_pro_mfp_m477-ps.ppd.gz";
      }
    ];
  };
}
