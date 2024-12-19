{ pkgs, ... }:
{
  gtk = {
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      # Prefer Dark Theme
      color-scheme = "prefer-dark";
      # Configure Battery Icon in GNOME
      show-battery-percentage = true;
    };

    # Configure Extensions in GNOME
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "clipboard-history@alexsaveau.dev"
      ];
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      # Configure Touchpad in GNOME
      disable-while-typing = false;
    };
  };
  home.packages = [
    pkgs.gnomeExtensions.appindicator # App Indicator
    pkgs.gnomeExtensions.clipboard-history # Clipboard History
  ];
}
