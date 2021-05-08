#!/bin/bash

set -exv

# build rom
source build/envsetup.sh
lunch aosp_shiva-userdebhg
mka bacon -j$(nproc --all)
