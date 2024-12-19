{
  config,
  pkgs,
  name,
  ...
}:
{
  users = {
    users = {
      ${name} = {
        isNormalUser = true;
        description = "Niko Cantero";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        hashedPasswordFile = config.sops.secrets.users_nyan_password.path;
        packages = [
          #Entertainment
          pkgs.element-desktop
          pkgs.fractal
          pkgs.goofcord
          pkgs.telegram-desktop
          pkgs.halloy # IRC
          pkgs.zulip
          pkgs.tidal-hifi
          pkgs.heroic # Heroic Launcher
          pkgs.foliate # eBooks
          pkgs.airshipper # Veloren
          pkgs.prismlauncher # Minecraft
          pkgs.slack
          pkgs.minetest
          #Tools
          pkgs.protonvpn-gui # VPN
          pkgs.nil # For VSCode
          pkgs.blender
          pkgs.zrythm
          pkgs.fragments
          pkgs.termscp
          pkgs.arduino-ide
          pkgs.resources
          pkgs.mousai
          pkgs.decibels
          pkgs.blanket
          pkgs.gnome-solanum
          pkgs.easyeffects
          pkgs.fw-ectool
          #For reviewing nixpkgs prs:
          pkgs.nixpkgs-review
          pkgs.nix-output-monitor
          pkgs.bubblewrap
        ];
      };
    };
  };
}
