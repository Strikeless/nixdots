{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      flat-remix-gnome
      gnome.gnome-music
    ];
  };

  # https://hoverbear.org/blog/declarative-gnome-configuration-in-nixos
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;

      enabled-extensions = [
        # TODO
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";

      # Fuck you gnome and your stupid hot corners, why haven't I switched back to KDE yet
      enable-hot-corners = false;
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Flat-Remix-Cyan-Darkest-FullPanel";
    };

    "org/gnome/nautilus/preferences" = {
      # Give me a usable location bar
      always-use-location-entry = true;
    };
  };
}

