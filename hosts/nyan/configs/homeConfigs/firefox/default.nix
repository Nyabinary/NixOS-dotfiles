{ ... }:
{
  programs.firefox = {
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "cookiebanners.service.mode" = 1;
          "image.jxl.enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.webrtc.globalMuteToggles" = true;
        };
        search = {
          force = true;
          default = "DuckDuckGo";
          order = [
            "DuckDuckGo"
            "Google"
          ];
        };
      };
    };
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      Cookies = {
        Locked = false;
        Behavior = "reject-tracker-and-partition-foreign";
        BehaviorPrivateBrowsing = "reject-tracker-and-partition-foreign";
      };
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "newtab";
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = false;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        #SocialTracking = true;
      };
      EncryptedMediaExtensions = {
        Enabled = true;
        Locked = false;
      };
      ExtensionSettings = {
        "moz-addon@7tv.app" = {
          installation_mode = "normal_installed";
          install_url = "https://extension.7tv.gg/v3.0.10.1000/ext.xpi";
          updates_disabled = false;
          default_area = "menubar";
        };
        "languagetool-webextension@languagetool.org" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/languagetool/latest.xpi";
          updates_disabled = false;
          default_area = "navbar";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          updates_disabled = false;
          default_area = "navbar";
        };
        "magnolia@12.34" = {
          installation_mode = "normal_installed";
          install_url = "https://gitflic.ru/project/magnolia1234/bpc_uploads/blob/raw?file=bypass_paywalls_clean-latest.xpi";
          updates_disabled = false;
          default_area = "menubar";
        };
        "{b5501fd1-7084-45c5-9aa6-567c2fcf5dc6}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ruffle_rs/latest.xpi";
          updates_disabled = false;
          default_area = "menubar";
        };
        "uBlock0@raymondhill.net" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          updates_disabled = false;
          default_area = "menubar";
        };
      };
      FirefoxHome = {
        Search = true;
        TopSites = true;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = true;
        SponsoredPocket = false;
        Locked = false;
      };
      FirefoxSuggest = {
        WebSuggestions = true;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = false;
      };
      HardwareAcceleration = true;
      Homepage = {
        URL = "about:home";
        Locked = false;
        StartPage = "homepage";
      };
      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
      Preferences = {
        "browser.contentblocking.category" = {
          Value = "strict";
          Status = "default";
        };
        "browser.ml.chat.enabled" = {
          Value = true;
          Status = "default";
        };
        "browser.theme.content-theme" = {
          Value = 2;
          Status = "default";
        };
        "browser.theme.toolbar-theme" = {
          Value = 2;
          Status = "default";
        };
        "extensions.activeThemeID" = {
          Value = "firefox-compact-dark@mozilla.org";
          Status = "default";
        };
        "geo.provider.network.url" = {
          Value = "https://beacondb.net/v1/geolocate";
          Status = "default";
        };
        "media.webrtc.camera.allow-pipewire" = {
          Value = true;
          Status = "default";
        };
        "privacy.globalprivacycontrol.enabled" = {
          Value = true;
          Status = "default";
        };
        "widget.use-xdg-desktop-portal.file-picker" = {
          Value = 1;
          Status = "default";
        };
        "widget.use-xdg-desktop-portal.location" = {
          Value = 1;
          Status = "default";
        };
        "widget.use-xdg-desktop-portal.mime-handler" = {
          Value = 1;
          Status = "default";
        };
        "widget.use-xdg-desktop-portal.open-uri" = {
          Value = 1;
          Status = "default";
        };
        "widget.use-xdg-desktop-portal.settings" = {
          Value = 1;
          Status = "default";
        };
        "widget.wayland.fractional-scale.enabled" = {
          Value = 1;
          Status = "default";
        };
      };
      SanitizeOnShutdown = {
        Cache = true;
        Cookies = false;
        History = true;
        Sessions = true;
        SiteSettings = true;
        OfflineApps = true;
        Locked = false;
      };
    };
  };
}
