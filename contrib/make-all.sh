#!/bin/sh
for target in $(contrib/list-targets.sh); do
  echo Building target \"$target\"
  contrib/actions/run-build.sh $target
done
