#!/bin/sh
set -e

apt-get update
apt-get install -y sudo python git make gcc g++ unzip libncurses5-dev zlib1g-dev subversion gawk bzip2 libssl-dev wget
git submodule update --init
