#!/bin/bash

set -exv

# sync rom
repo init -u git://github.com/crdroidandroid/android.git -b 10.0 --depth=1
git clone https://github.com/theRay1s/android_manifest --depth=1 -b lineage-17.1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

