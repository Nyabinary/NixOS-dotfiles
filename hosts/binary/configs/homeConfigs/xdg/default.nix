{ pkgs, ... }:
{
  xdg = {
    mimeApps = {
      defaultApplications = {
        "x-scheme-handler/http" = "firefox-nightly.desktop";
        "x-scheme-handler/https" = "firefox-nightly.desktop";
        "x-scheme-handler/chrome" = "firefox-nightly.desktop";
        "text/html" = "firefox-nightly.desktop";
        "application/x-extension-htm" = "firefox-nightly.desktop";
        "application/x-extension-html" = "firefox-nightly.desktop";
        "application/x-extension-shtml" = "firefox-nightly.desktop";
        "application/xhtml+xml" = "firefox-nightly.desktop";
        "application/x-extension-xhtml" = "firefox-nightly.desktop";
        "application/x-extension-xht" = "firefox-nightly.desktop";
        "x-scheme-handler/mailto" = "thunderbird.desktop";
        "message/rfc822" = "thunderbird.desktop";
        "x-scheme-handler/mid" = "thunderbird.desktop";
        "text/calendar" = "org.gnome.Calendar.desktop";
        "x-scheme-handler/news" = "thunderbird.desktop";
        "x-scheme-handler/snews" = "thunderbird.desktop";
        "x-scheme-handler/nntp" = "thunderbird.desktop";
        "x-scheme-handler/feed" = "thunderbird.desktop";
        "application/rss+xml" = "thunderbird.desktop";
        "application/x-extension-rss" = "thunderbird.desktop";
      };
    };
    portal = {
      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-gtk
      ];
      configPackages = [ pkgs.gnome-session ];
    };
  };
}
