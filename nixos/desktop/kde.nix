{ pkgs, plasma6, ... }: {
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; with pkgs.kdePackages; [
    plasma-browser-integration
    fwupd
    kalk
    krita
    aha
    partitionmanager
  ];

  environment.sessionVariables = {
    # https://community.kde.org/KWin/Environment_Variables#KWIN_EXPLICIT_SYNC
    #KWIN_TRIPLE_BUFFER = "1";
  };
}

