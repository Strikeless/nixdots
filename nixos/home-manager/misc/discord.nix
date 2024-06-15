{ pkgs, ... }: {
  home.packages = with pkgs; [
    (discord.override {
      # sometimes needs a single launch without any modifications:
      # https://github.com/NixOS/nixpkgs/issues/208749
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
