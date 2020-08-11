#!/bin/sh
cd $(git rev-parse --show-toplevel)/gluon
export GLUON_SITEDIR=../
make list-targets
