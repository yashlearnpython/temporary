#!/bin/bash

set -exv

# build rom
source build/envsetup.sh
lunch aosp_shiva-userdebhg
mka bacon -j$(nproc --all)

# upload rom
up(){
		curl --upload-file $1 https://transfer.sh/$(basename $1); echo
			# 14 days, 10 GB limit
		}

	up out/target/product/shiva/*.zip

