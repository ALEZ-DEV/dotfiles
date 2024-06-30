#!/bin/sh

# Ensure HOST is set
if [ -z "$HOST" ]; then
	echo "HOST is not set. Please set HOST to the desired system name."
	echo "You can just execute the following command :"
	echo "source ./set-host-name.sh"
	echo "Be sure to change the host value before executing this command"
	exit 1
fi

sudo HOST=$HOST nixos-rebuild switch --flake ~/dotfiles#$HOST --impure
