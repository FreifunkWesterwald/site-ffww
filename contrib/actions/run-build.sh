#!/bin/sh
set -e

cd gluon/
export GLUON_BRANCH=${GLUON_BRANCH:-master}
export GLUON_TARGET=$1

export GLUON_SITEDIR=../
export GLUON_AUTOREMOVE=1

echo "
Freifunk Westerwald
Gluon Firmware Build

Version:   $GLUON_RELEASE
Branch:    $GLUON_BRANCH
Target(s): $GLUON_TARGET
"

if [ -z "$MAKE_PARALLEL" ]; then
   MAKE_PARALLEL="2"
fi
MAKE_OPTS="$MAKE_OPTS -j$MAKE_PARALLEL"

if [ -z "$VERBOSE" ]; then
  export BUILD_LOG=1
  MAKE_OPTS="$MAKE_OPTS V=s"
fi

make update
make $MAKE_OPTS
make manifest
