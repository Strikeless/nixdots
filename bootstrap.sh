#!/usr/bin/env sh
# This relies on the default path for nixos configuration.
mv /etc/nixos /etc/nixos.old
ln -sf "$(pwd)/nixos" /etc
