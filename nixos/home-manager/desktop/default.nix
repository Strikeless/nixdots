{ pkgs, ... }: {
  imports = [
    #./gtk.nix
    #./gnome.nix # get out off my face gnome
    ./kde.nix
  ];
  home = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [ "Cousine" ];
      })

      xclip
      #pkgs.wl-clipboard

      qpwgraph
    ];
  };
}
