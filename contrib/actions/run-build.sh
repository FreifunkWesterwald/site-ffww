#!/bin/sh
set -e

cd gluon/
export GLUON_BRANCH=${GLUON_BRANCH:-master}
export GLUON_TARGET=$1

export GLUON_SITEDIR=../
export BUILD_LOG=1
export GLUON_AUTOREMOVE=1

echo "
Freifunk Westerwald
Gluon Firmware Build

Version:   $GLUON_RELEASE
Branch:    $GLUON_BRANCH
Target(s): $GLUON_TARGET
"

make update
make -j2 V=s
