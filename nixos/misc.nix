# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
  # RTL-SDR hardware support
  hardware.rtl-sdr.enable = true;
  users.extraGroups.plugdev.members = [ "h" ];

  # Wireshark permission foolery
  programs.wireshark.enable = true;
  users.extraGroups.wireshark.members = [ "h" ];

  # Virt-manager
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  # Docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "h" ];

  # Shell
  programs.zsh.enable = true;
  users.users.h.shell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
