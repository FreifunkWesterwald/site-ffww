#!/usr/bin/env python3

import sys

ACTIONS_HEAD = """
# Update this file after adding/removing/renaming a target by running
# `make list-targets | ./contrib/generate-actions.py > ./.github/workflows/build-gluon.yml`
name: Build Gluon
on:
  push:
    branches:
      - build
jobs:
"""

ACTIONS_TARGET="""
  {target_name}:
    name: {target_name}
    runs-on: ubuntu-latest
    steps:
      
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Install apt Dependencies
        run: sudo contrib/actions/setup-dependencies.sh

      - name: Build
        run: contrib/actions/run-build.sh {target_name}

      - name: Archive build logs
        if: ${{{{ !cancelled() }}}}
        uses: actions/upload-artifact@v2
        with:
          name: {target_name}_logs
          path: gluon/openwrt/logs

      - name: Archive build output
        uses: actions/upload-artifact@v2
        with:
          name: {target_name}_output
          path: gluon/output
"""

output = ACTIONS_HEAD

for target in sys.stdin:
	output += ACTIONS_TARGET.format(target_name=target.strip())

print(output)
