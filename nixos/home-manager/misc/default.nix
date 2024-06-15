{ pkgs, ... }: {
  imports = [
    ./spotify.nix
    ./discord.nix
    ./ripping.nix
  ];

  home.packages = with pkgs; [
    bitwarden
    audacity
    obs-studio
  ];
}
