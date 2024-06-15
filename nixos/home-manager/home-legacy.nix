#
# Everything from the previous mess of a home.nix that hasn't gotten a new home yet
#
# Note to self: don't you dumbass fucking dare add anything new in here or
#               you know your lazy ass will be fucked.
#

{ config, pkgs, ... }:
{
  # Don't remember why I put this here
  fonts.fontconfig.enable = true;

  home = {
    packages = [
      pkgs.zsh-completions
      pkgs.pkg-config
      pkgs.ffmpeg_6-full
      pkgs.imagemagick
      pkgs.udev
      pkgs.udev.dev
      pkgs.fontconfig
      pkgs.fontconfig.dev
      
      pkgs.distrobox
      pkgs.bitwarden

      pkgs.rubyripper
      pkgs.cdrdao
      pkgs.flac
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  #
  # Program modules
  #
  programs = {
    neovim.enable = true;

    zsh = {
      enable = true;

      shellAliases = {
        vim = "nvim";
        nix-find = "ls /nix/store | grep -e ";
	nix-update = "sudo nixos-rebuild switch --upgrade && home-manager switch";
	nix-gc = "sudo nix-collect-garbage && nix-collect-garbage";
      };

      zplug = {
        enable = true;

	plugins = [
	  { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
	  { name = "zsh-users/zsh-autosuggestions"; }
	];
      };

      initExtra = ''
        source ~/.p10k.zsh
      '';
    };
  };
}
