# https://nixos.wiki/wiki/Home_Manager
{ config, pkgs, ... }:
let
  # home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz"; # Unstable
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.h = {
    imports = [
      ./home-legacy.nix
      ./desktop/default.nix
      ./radio/default.nix
      ./development/default.nix
      ./misc/default.nix
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
  };
}

