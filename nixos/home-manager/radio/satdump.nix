# https://github.com/SatDump/SatDump/issues/685
{ stdenv, fetchgit, cmake, pkg-config, config, pkgs, ... }:

stdenv.mkDerivation rec {
  pname = "satdump";
  version = "1.2.0";

  src = fetchgit {
    url = "https://github.com/SatDump/SatDump.git";
    rev = "1.2.0";
    sha256 = "sha256-QGegi5/geL5U3/ecc3hsdW+gp25UE9fOYVLFJUo/N50=";
  };

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = with pkgs; [
    # required deps
    fftwFloat
    libpng
    libtiff
    jemalloc
    volk
    (nng.overrideAttrs (old: {
      cmakeFlags = old.cmakeFlags ++ [ "-DBUILD_SHARED_LIBS=ON" ];
    }))
    rtl-sdr
    hackrf
    airspy
    airspyhf
    glfw
    gnome.zenity
    zstd

    # optional hw support
    libad9361
    libiio

    # audio is pretty cool
    portaudio
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];
}
