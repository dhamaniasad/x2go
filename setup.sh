#!/bin/bash

# Update repositories and upgrade packages

apt-get update
apt-get upgrade

DEBIAN_FRONTEND=noninteractive apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E

apt-get install nano

echo "deb http://packages.x2go.org/debian wheezy main
deb-src http://packages.x2go.org/debian wheezy main" > /etc/apt/sources.list.d/x2go.list