#!/usr/bin/env python3

import sys


ACTIONS_HEAD = """
# Update this file after adding/removing/renaming a target by running
# `contrib/list-targets.sh | contrib/generate-actions.py > .github/workflows/build-gluon.yml`
name: Build Gluon
on:
  release:
    types:
      - 'published'
jobs:
"""

ACTIONS_TARGET="""
  {target_name}:
    name: {target_name}
    runs-on: ubuntu-latest
    steps:
      - name: Compute tag name
        id: tag_name
        run: echo ::set-output name=tag_name::$(echo ${{{{ github.ref }}}} | sed 's!refs/tags/!!')
      
      - name: Checkout repository
        uses: actions/checkout@v2
        with:
          fetch-depth: 0

      # This controls the auto-updater
      - name: Set GLUON_BRANCH environment variable
        run: echo ::set-env name=GLUON_BRANCH::$( [[ "${{{{ github.ref }}}}" =~ "unstable" ]] && echo unstable || echo stable)

      - name: Set GLUON_RELEASE environment variable
        run: echo ::set-env name=GLUON_RELEASE::${{BUILD_VERSION:-XX}}
        env:
          BUILD_VERSION: ${{{{ steps.tag_name.outputs.tag_name }}}}

      - name: Install apt Dependencies
        run: sudo contrib/actions/setup-dependencies.sh

      - name: Build
        run: contrib/actions/run-build.sh {target_name}

      #TODO: Auto-activate, when verbose logging is enabled?
      #- name: Archive build logs
      #  if: ${{{{ !cancelled() }}}}
      #  uses: actions/upload-artifact@v2
      #  with:
      #    name: {target_name}_logs
      #    path: gluon/openwrt/logs

      - name: Archive build output
        uses: actions/upload-artifact@v2
        with:
          name: {target_name}_output
          path: gluon/output
      
      - name: build-tar
        run: tar cJf {target_name}.tar.xz -C gluon/output .
      
      - name: Upload Release Asset
        id: upload-release-asset 
        uses: actions/upload-release-asset@v1
        env:
          GITHUB_TOKEN: ${{{{ secrets.GITHUB_TOKEN }}}}
        with:
          upload_url: ${{{{ github.event.release.upload_url }}}} 
          asset_path: ./{target_name}.tar.xz
          asset_name: {target_name}.tar.xz
          asset_content_type: application/x-xz
"""

output = ACTIONS_HEAD

for target in sys.stdin:
    output += ACTIONS_TARGET.format(target_name=target.strip())
print(output)
