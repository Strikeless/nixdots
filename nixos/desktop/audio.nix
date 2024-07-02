{ pkgs, ... }:
let
  SAMPLE_RATE = 192000;
  QUANTUM = 32;
in {
  #
  # Enable sound with pipewire.
  # https://nixos.wiki/wiki/PipeWire
  #
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true; # Jack frontend has only caused issues for me

    # Use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;

    extraConfig.pipewire."93-quality" = {
      context.properties = {
        default.clock.rate = SAMPLE_RATE;
      };

      # No clue whether or not this is only for pipewire-pulse...
      stream.properties = {
        resample.quality = 10;
      };
    };

    extraConfig.pipewire-pulse."93-quality" = {
      stream.properties = {
        resample.quality = 10;
       };
    };

    wireplumber.configPackages = [
      (pkgs.writeTextDir "share/wireplumber/main.lua.d/93-quality.lua" ''
        alsa_monitor.rules = {
          {
            matches = {{{ "node.name", "matches", "alsa_output.*" }}};
            apply_properties = {
              ["audio.format"] = "S32LE",
              ["audio.rate"] = "${toString SAMPLE_RATE}", -- for USB soundcards it should be twice your desired rate
              -- ["api.alsa.period-size"] = 2, -- defaults to 1024, tweak by trial-and-error
              -- ["api.alsa.disable-batch"] = true, -- generally, USB soundcards use the batch mode
            },
          },
        }
      '')
    ];

    extraConfig.pipewire."92-low-latency" = {
      context.properties = {
        default.clock.quantum = QUANTUM;
	default.clock.min-quantum = QUANTUM;
	default.clock.max-quantum = QUANTUM;
      };
    };

    extraConfig.pipewire-pulse."92-low-latency" = {
      context.modules = [
        {
	  name = "libpipewire-module-protocol-pulse";
	  args = {
            pulse.min.req = "${toString QUANTUM}/${toString SAMPLE_RATE}";
            pulse.default.req = "${toString QUANTUM}/${toString SAMPLE_RATE}";
            pulse.max.req = "${toString QUANTUM}/${toString SAMPLE_RATE}";
            pulse.min.quantum = "${toString QUANTUM}/${toString SAMPLE_RATE}";
            pulse.max.quantum = "${toString QUANTUM}/${toString SAMPLE_RATE}";
	  };
	}
      ];

      stream.properties = {
        node.latency = "${toString QUANTUM}/${toString SAMPLE_RATE}";
      };
    };
  };
}

