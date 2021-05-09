#!/bin/bash

set -exv


# build rom with 64 cores
source build/envsetup.sh
lunch lineage_RMX2020-userdebug
export SKIP_ABI_CHECKS=true
export SKIP_API_CHECKS=true
export SAKURA_MAINTAINER=sarthakroy2002
mka bacon -j10

