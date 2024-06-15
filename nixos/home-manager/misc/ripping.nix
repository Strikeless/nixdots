{ pkgs, ... }: {
  home.packages = with pkgs; [
    rubyripper
    cdrdao
    flac
  ];
}
