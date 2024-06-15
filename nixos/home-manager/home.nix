{ config, pkgs, ... }: {
  imports = [
    ./home-legacy.nix
    ./desktop/default.nix
    ./radio/default.nix
    ./misc/default.nix
    ./development/default.nix
  ];

  home = {
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "23.11";

    username = "h";
    homeDirectory = "/home/h";
  };

  nixpkgs = {
    config = {
      # Allow unfree packages.
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # Let home-manager manage itself.
  programs.home-manager.enable = true;
}
