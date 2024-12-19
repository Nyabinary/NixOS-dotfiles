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

  # sops-nix
  sops = {
    defaultSopsFile = ./secrets/binary.yaml;
    age.keyFile = "/home/nyan/.config/sops/age/keys.txt";
    secrets.users_binary_password.neededForUsers = true;
  };

  # Exclude certain Gnome packages
  environment.gnome.excludePackages = with pkgs; [
    epiphany # web browser
    gnome-console
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
  };
}
