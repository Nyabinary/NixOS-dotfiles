{ pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  # Enable the GNOME & X11 windowing system
  # Enable BTRFS autoscrubbing
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
      };
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };
      desktopManager = {
        gnome.enable = true;
      };
    };
    btrfs = {
      autoScrub = {
        enable = true;
        fileSystems = [ "/" ];
      };
    };
    openssh = {
      enable = true;
      startWhenNeeded = true;
    };
  };

  services.geoclue2 = {
    enable = true;
    geoProviderUrl = "https://beacondb.net/v1/geolocate";
  };

  # sops-nix
  sops = {
    defaultSopsFile = ./secrets/nyan.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/home/binary/.config/sops/age/keys.txt";
      generateKey = true;
    };
    secrets = {
      users_nyan_password = {
        neededForUsers = true;
        format = "yaml";
        sopsFile = ./secrets/nyan.yaml;
      };
      users_nyan_languagetool_api_key = {
        format = "yaml";
        sopsFile = ./secrets/nyan.yaml;
      };
      users_nyan_email = {
        format = "yaml";
        sopsFile = ./secrets/nyan.yaml;
      };
    };
  };

  # Exclude certain Gnome packages
  environment.gnome.excludePackages = with pkgs; [
    epiphany # web browser
    gnome-console
    gnome-music
    gnome-system-monitor
  ];

  xdg.terminal-exec = {
    package = pkgs.xdg-terminal-exec-mkhl;
    enable = true;
    settings = {
      GNOME = [ "rio.desktop" ];
    };
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
      };
      extest = {
        enable = true;
      };
    };
    mtr = {
      enable = true;
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
    kdeconnect = {
      package = pkgs.gnomeExtensions.gsconnect;
      enable = true;
    };
  };
}
