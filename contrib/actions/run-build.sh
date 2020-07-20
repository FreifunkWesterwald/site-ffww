#!/bin/sh
set -e

cd gluon/
export GLUON_BUILD=1
export GLUON_BRANCH=master
export GLUON_TARGET=$1
export GLUON_SITEDIR=../
export BUILD_LOG=1

make update
make -j2 V=s
