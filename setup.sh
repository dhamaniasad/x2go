#!/bin/bash

# Check if the script is being run as root 

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Update repositories and upgrade packages

apt-get update
apt-get -y upgrade

# Add key for x2go-server

DEBIAN_FRONTEND=noninteractive apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E

# Install GNU Nano

apt-get -y install nano

# Add x2go repositories; update repo db

echo "deb http://packages.x2go.org/debian wheezy main
deb-src http://packages.x2go.org/debian wheezy main" > /etc/apt/sources.list.d/x2go.list

apt-get -y update

# Install x2go-keyring

apt-get -y install x2go-keyring

apt-get update

# Install xfce4

apt-get -y install xfce4

# Install iceweasel browser

apt-get -y install iceweasel

# Install x2goserver

apt-get install x2goserver*

# Start x2goserver

service x2goserver start

echo "The server has now been setup. To connect to it, please use x2goclient, available from here : http://wiki.x2go.org/doku.php/doc:installation:x2goclient"