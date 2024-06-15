final: prev:
{
  weather_sat_decoder = false;
  m17_decoder = false;
  falcon9_decoder = false;

  sdrpp = prev.sdrpp.overrideAttrs(old: rec {
    #version = "master";
    version = "206ce6e8c37aa7ee2e1990b80644330b6ac69b6b"; # 8.6.2024

    src = prev.fetchFromGitHub {
      owner = "AlexandreRouma";
      repo = "SDRPlusPlus";
      rev = version;
      sha256 = "sha256-pShU0EWVtquYk2aLhVcxPCujibqy7f4sKmzuNY7oyK4=";
      #sha256 = "sha256-1lwRsaMKKxySsp/rJQWt11QIIj5aaDH17bLD52dvBT0=";
    };

    nativeBuildInputs = [ prev.cmake prev.pkg-config prev.zstd.dev ];
  });
}
