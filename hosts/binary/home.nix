{ ... }:
{
  # Import home modules
  imports = [
    ./configs/homeConfigs
    ../../modules/homeModules
  ];

  # Enable home modules
  homeModules = {
    direnv.enable = true;
    firefox.enable = true;
    git.enable = true;
    gitui.enable = true;
    gpg.enable = true;
    gtk.enable = true;
    helix.enable = true;
    jujutsu.enable = true;
    libreoffice.enable = true;
    nushell.enable = true;
    qt.enable = true;
    rage.enable = true;
    rio.enable = true;
    sops.enable = true;
    thunderbird.enable = true;
    vscode.enable = true;
    xdg.enable = true;
  };
}
