{ pkgs, ... }: {
  nixpkgs.overlays = [
    (import ./sdrpp.nix)
  ];

  home.packages = with pkgs; [
    rtl-sdr-blog

    soapysdr

    sdrpp
    gnuradio
    kalibrate-rtl
    fldigi
    urh
    gpredict
    dump1090
    rtl_433

    (callPackage ./satdump.nix {})
  ];
}
