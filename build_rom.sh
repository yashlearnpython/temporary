#!/bin/bash

# sync rom
repo init --depth=1 -u git://github.com/ForkLineageOS/android.git -b lineage-18.1 -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/Realme-G70-Series/local_manifest.git -b 11-staging --depth 1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

# build rom
source build/envsetup.sh
lunch lineage_RMX2020-userdebug
export SKIP_ABI_CHECKS=true
export SKIP_API_CHECKS=true
mka bacon

# upload rom
time rclone copy out/target/product/mojito/*UNOFFICIAL*.zip cirrus:RMX2020 -P
