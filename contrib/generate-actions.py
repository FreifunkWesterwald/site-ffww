#!/usr/bin/env python3

import sys


ACTIONS_HEAD = """
# Update this file after adding/removing/renaming a target by running
# `contrib/list-targets.sh | contrib/generate-actions.py > .github/workflows/build-gluon.yml`
name: Build Gluon
on:
  push:
    tags:
      - '*'
jobs:
  create-release:
    runs-on: ubuntu-latest
    outputs:
      upload_url: ${{ steps.create_release.outputs.upload_url }}
      tag_name: ${{ steps.tag_name.outputs.tag_name }}
    steps:
      - name: Compute tag name
        id: tag_name
        run: echo ::set-output name=tag_name::$(echo ${{ github.ref }} | sed 's!refs/tags/!!')
        
      - name: Check if this is an unstable release
        id: check_unstable
        run: |
         if [[ ${{ steps.tag_name.outputs.tag_name }} =~ ^unstable ]]; then
           echo ::set-output name=unstable_release::true
         else 
           echo ::set-output name=unstable_release::false
         fi
          
      - name: Create Release
        id: create_release
        uses: actions/create-release@v1
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          tag_name: ${{ github.ref }}
          release_name: Release ${{ steps.tag_name.outputs.tag_name }}
          draft: false
          prerelease: ${{ steps.check_unstable.outputs.unstable_release }}
"""

ACTIONS_TARGET="""
  {target_name}:
    name: {target_name}
    runs-on: ubuntu-latest
    needs: create-release
    steps:
      
      - name: Checkout repository
        uses: actions/checkout@v2
        with:
          fetch-depth: 0

      - name: Set GLUON_BRANCH environment variable
        run: echo ::set-env name=GLUON_BRANCH::master

      - name: Set GLUON_RELEASE environment variable
        run: echo ::set-env name=GLUON_RELEASE::${{BUILD_VERSION:-XX}}+${{GLUON_BRANCH:-master}}$(date '+%Y%m%d%H%M')
        env:
          BUILD_VERSION: ${{{{ needs.create-release.outputs.tag_name }}}}

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
      
      - name: build-tar
        run: tar --zstd -cf {target_name}.tar.zst -C gluon/output .
      
      - name: Upload Release Asset
        id: upload-release-asset 
        uses: actions/upload-release-asset@v1
        env:
          GITHUB_TOKEN: ${{{{ secrets.GITHUB_TOKEN }}}}
        with:
          upload_url: ${{{{ needs.create-release.outputs.upload_url }}}} 
          asset_path: ./{target_name}.tar.zst
          asset_name: {target_name}.tar.zst
          asset_content_type: application/zstd
"""

output = ACTIONS_HEAD

for target in sys.stdin:
    output += ACTIONS_TARGET.format(target_name=target.strip())
print(output)
