#!/bin/sh
set -e

git submodule update --init 
apt-get install git make gcc g++ unzip libncurses5-dev zlib1g-dev subversion gawk bzip2 libssl-dev wget