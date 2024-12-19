{ ... }:
{
  programs.thunderbird = {
    profiles = {
      default = {
        isDefault = true;
        settings = {
          #TODO fill this out :p

          # Disable remote content
          "mailnews.message_display.disable_remote_image" = true;

          # Startpage
          "mailnews.start_page.enabled" = true;

          # E2EE stuff
          "mail.e2ee.auto_enable" = true;
          "mail.e2ee.auto_disable" = true;

          # Spam
          "mail.spam.manualMark" = true;
          "mail.spam.markAsReadOnSpam" = true;
          "mail.server.default.purgeSpam" = true;
          "mail.server.default.purgeSpamInterval" = 14;
          "browser.download.enable_spam_prevention" = true;

          # Enable search integration
          "searchintegration.enabled" = true;

          # disable UI instrumentation
          "mail.instrumentation.postUrl" = "";
          "mail.instrumentation.askUser" = false;
          "mail.instrumentation.userOptedIn" = false;

          # TODO: these are mostly shared with Firefox:

          # Use BeaconDB location services
          "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";

          # Disable Telemetry
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.policy.dataSubmissionPolicyBypassNotification" = true;

          # Disable Telemetry Coverage
          "toolkit.coverage.opt-out" = true;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";

          # Disable ping center telemetry
          "browser.ping-centre.telemetry" = false;

          # Disable Normandy
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";

          # Privacy
          "privacy.donottrackheader.enabled" = true;
          "privacy.clearOnShutdown.cache" = true;

          # Disable addon suggestions
          "extensions.getAddons.showPane" = false;

          # Use XDG desktop portals
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "widget.use-xdg-desktop-portal.location" = 1;
          "widget.use-xdg-desktop-portal.mime-handler" = 1;
          "widget.use-xdg-desktop-portal.open-uri" = 1;
          "widget.use-xdg-desktop-portal.settings" = 1;
        };
      };
    };
  };
}
