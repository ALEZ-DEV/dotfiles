#!/bin/sh

# Ensure HOST is set
if [ -z "$HOST" ]; then
	echo "HOST is not set. Please set HOST to the desired system name."
	echo "You can just execute the following command :"
	echo "source ./set-host-name.sh"
	echo "Be sure to change the host value before executing this command"
	exit 1
fi

# this script just copy the hardware-confirguration.nix from /etc/nixos
#mkdir ~/dotfiles/hosts/$HOST
sudo cp /etc/nixos/hardware-configuration.nix ~/dotfiles/hosts/$HOST/hardware-configuration.nix
sudo chown $USER ~/dotfiles/hosts/$HOST/hardware-configuration.nix
