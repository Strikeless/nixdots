{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      #
      # Software
      #
      git
      #gcc
      clang
      rustup
      lld # LLD linker
      nixd # Nix LSP
      jdk17 # java :(
      python3 # python :(
      go

      #
      # Hardware
      #
      digital

      #
      # Misc
      #
      obsidian
      edl
      ghidra
      wireshark
      usbutils
      avrdude

      avalonia-ilspy
    ];
  };

  programs = {
    vscode = {
      enable = true;
      #package = pkgs.vscodium;
    };
  };
}
