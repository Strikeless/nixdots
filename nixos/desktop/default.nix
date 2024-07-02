{ pkgs, ... }: {
  imports = [
    ./kde.nix
    ./nvidia.nix
    ./audio.nix
  ];

  services.xserver = {
    # Enable Xorg or Wayland, nevermind the name xserver.
    enable = true;

    ## Enable touchpad support (enabled by default in most desktop managers).
    #libinput.enable = true;
  };

  # Enable automatic login for the user.
  /*services.displayManager.autoLogin = {
    enable = true;
    user = "h";
  };*/

  # Make Chromium and Electron based applications run Wayland natively.
  # Seems to have no effect when running on X11.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Temporary fix for firefox crashing with explicit sync.
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1898476
  # Remove when bug is fixed, xwayland isn't optimal.
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "0";

  environment.systemPackages = with pkgs; [
    clinfo
    glxinfo
    vulkan-tools
    wayland-utils
    pciutils
    #vulkan-loader
  ];
}

