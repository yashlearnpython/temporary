#!/bin/bash

# sync rom
repo init -u https://github.com/P-404/platform_manifest -b rippa --depth=1 -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/Project404-whyred/local_manifests.git .repo/local_manifests --depth=1
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

# build rom
source build/envsetup.sh
lunch p404_whyred-userdebug
mka bacon

# upload rom
time rclone copy out/target/product/whyred/*.zip cirrus:whyred -P
