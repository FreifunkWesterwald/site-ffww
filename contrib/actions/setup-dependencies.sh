#!/bin/sh
set -e

apt-get update
apt-get install -y sudo python3 git make gcc g++ unzip libncurses5-dev zlib1g-dev subversion gawk bzip2 libssl-dev \
                   wget rsync file
