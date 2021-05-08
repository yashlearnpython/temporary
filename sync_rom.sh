#!/bin/bash

set -exv

# sync rom
repo init --depth=1 -u https://github.com/PixelExperience/manifest -b eleven-plus
git clone https://github.com/zubairk22oct/android_.repo_local_manifests --depth=1 -b pe .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

#patch
cd frameworks/base && rm -rf *patch && wget https://ghostmirror.hitesh920.workers.dev/0://0001-SystemUI-ScreenMediaRecorder-Use-Baseline-41.patch && git apply 0001-SystemUI-ScreenMediaRecorder-Use-Baseline-41.patch && cd - && cd vendor/lineage && git fetch "https://github.com/LineageOS/android_vendor_lineage" refs/changes/98/303898/3 && git cherry-pick FETCH_HEAD && cd -


