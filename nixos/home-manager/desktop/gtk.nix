{ pkgs, ... }:
let theme = "Flat-Remix-GTK-Cyan-Darkest-Solid";
in {
  home.sessionVariables.GTK_THEME = theme;

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = theme;
    };

    gtk3.extraConfig.Settings = ''
      gtk-application-prefer-dark-theme=1
    '';

    gtk4.extraConfig.Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };
}

