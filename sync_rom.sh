#!/bin/bash

set -exv

# sync rom
repo init -u https://github.com/Havoc-OS/android_manifest.git -b eleven
git clone https://github.com/Hashimkp/local_manifests.git --depth=1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)


