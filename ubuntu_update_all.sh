#!/bin/bash

set -eu

sudo apt update -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean -y
sudo apt autoclean -y

sudo snap refresh
sudo snap list --all | awk '/disabled/{print $1, $3}' |
	    while read snapname revision; do
		sudo snap remove "$snapname" --revision="$revision"
	    done

sudo systemctl daemon-reload
