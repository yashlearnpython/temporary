#!/bin/bash

set -exv


# build rom with 10 cores
source build/envsetup.sh
lunch lineage_RMX2050-userdebug
export SKIP_ABI_CHECKS=true
export SKIP_API_CHECKS=true
mka bacon -j10

