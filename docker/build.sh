#!/bin/bash
set -e

# define parameters
VERSION=unset
TARGET=unset

usage() {
  echo "Usage $0 [ -v= | --version= ] [ -t= | --target= ] [ -m= | --makethreads= ] [ -h | --help ]
       Start a firmware build.
       If '-v' or '--version' must be given and denotes the version string.
       If '-t' or '--target' denotes the target name.
       If '-m' or '--makethreads' define the number of build threads.
       If '-h' or '--help' is given, this message is printed."

  exit 2
}

PARSED_ARGUMENTS=$(getopt -a -n alphabet -o m:t:hv: --long makethreads:,target:,help,version: -- "$@")
VALID_ARGUMENTS=$?
if [ "$VALID_ARGUMENTS" != "0" ]; then
  usage
fi

eval set -- "$PARSED_ARGUMENTS"
while :
do
  case "$1" in
    -v | --version) VERSION=$2  ; shift 2 ;;
    -t | --target) TARGET=$2  ; shift 2 ;;
    -m | --makethreads) THREADS=$2  ; shift 2 ;;
    -h | --help) usage ;;
    # -- means the end of the arguments; drop this, and break out of the while loop
    --) shift; break ;;
    # If invalid options were passed, then getopt should have reported an error,
    # which we checked as VALID_ARGUMENTS when getopt was called...
    *) echo "Unexpected option: $1 - this should not happen."
       usage ;;
  esac
done

if [ "$VERSION" = "unset" -o -z "$VERSION" ]; then
  echo 'option -v | --version requires an argument'
  exit 1
fi

# install build dependencies
contrib/actions/setup-dependencies.sh

if [ "$TARGET" = "unset" -o -z "$TARGET" ]; then
  sudo -u build \
    GLUON_AUTOUPDATER_BRANCH=$( [[ "$VERSION" =~ "unstable" ]] && echo unstable || echo stable) \
    GLUON_AUTOUPDATER_ENABLED="1"\
    GLUON_RELEASE="$VERSION" \
    MAKE_PARALLEL="$THREADS" \
    contrib/make-all.sh
else
  sudo -u build \
    GLUON_AUTOUPDATER_BRANCH=$( [[ "$VERSION" =~ "unstable" ]] && echo unstable || echo stable) \
    GLUON_AUTOUPDATER_ENABLED="1"\
    GLUON_RELEASE="$VERSION" \
    MAKE_PARALLEL="$THREADS" \
    contrib/actions/run-build.sh "$TARGET"
fi
