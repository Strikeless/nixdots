{ pkgs, /*plasma5,*/ plasma6, ... }: {
  services.displayManager.sddm.enable = true;

  # Plasma 5
  #services.xserver.desktopManager.plasma5.enable = true;

  # Plasma 6
  services.desktopManager.plasma6.enable = true;

  # Use wayland on Plasma 5
  /*services.displayManager = {
    defaultSession = "plasmawayland";
    sddm.wayland.enable = true;
    sddm.settings.Wayland.SessionDir = "${pkgs.plasma5Packages.plasma-workspace}/share/wayland-sessions";
  };*/
  
  # libsForQt5 for Plasma 5, kdePackages for Plasma 6
  environment.systemPackages = with pkgs; /*with pkgs.libsForQt5;*/ with pkgs.kdePackages; [
    plasma-browser-integration
    fwupd
    kalk
  ];

  environment.sessionVariables = {
    # https://community.kde.org/KWin/Environment_Variables#KWIN_EXPLICIT_SYNC
    KWIN_TRIPLE_BUFFER = "1";
  };
}

