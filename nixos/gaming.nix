# Much of this is from https://www.youtube.com/watch?v=qlfm3MEbqYA
{ pkgs, ... }: {
  # NOTE: gamemode, gamescope, and mangohud aren't magic, they're not used by default.
  # In Steam, the launch options can be changed to use these utilities:
  # "gamemoderun gamescope mangohud %command%"

  programs.steam = {
    enable = true;

    gamescopeSession.enable = true; # Enable use of the gamescope microcompositor

    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # https://github.com/FeralInteractive/GameMode
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    protonup # CLI tool for updating proton imperatively
    mangohud

    lutris
    wineWowPackages.stable
  ];

  environment.sessionVariables = {
    # Path for protonup to install proton to.
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/h/.steam/root/compatibilitytools.d";
  };
}

