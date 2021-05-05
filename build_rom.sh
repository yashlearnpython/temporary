#!/bin/bash

set -e
set -x

# sync rom
repo init -u git://github.com/ShapeShiftOS/android_manifest.git -b android_11 --depth=1
git clone --depth=1 https://github.com/Unknownbitch07/android_device_xiaomi_msm8953-common.git -b ssos-11.0 device/xiaomi/msm8953-common
git clone --depth=1 https://github.com/Unknownbitch07/android_device_xiaomi_tissot.git -b ssos-11.0 device/xiaomi/tissot
git clone --depth=1 https://github.com/Unknownbitch07/android_kernel_xiaomi_msm8953.git -b 11.0 kernel/xiaomi/msm8953
git clone https://gitlab.com/Sohil876/proprietary_vendor_xiaomi.git -b eleven vendor/xiaomi --single-branch --depth=1
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)

# hals
rm -rf hardware/qcom-caf/display hardware/qcom-caf/media hardware/qcom-caf/audio
rm -rf hardware/qcom-caf/msm8996/display hardware/qcom-caf/msm8996/audio hardware/qcom-caf/msm8996/media
git clone https://github.com/crdroidandroid/android_hardware_qcom_display.git -b 11.0-caf-msm8996 hardware/qcom-caf/msm8996/display
git clone https://github.com/crdroidandroid/android_hardware_qcom_media.git -b 11.0-caf-msm8996 hardware/qcom-caf/msm8996/media
git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-18.0-caf-msm8996 hardware/qcom-caf/msm8996/audio

# build rom
source build/envsetup.sh
lunch ssos_tissot-userdebug
make bacon

# upload rom
up(){
	curl --upload-file $1 https://transfer.sh/$(basename $1); echo
	# 14 days, 10 GB limit
}

up out/target/product/tissot/ShapeShiftOS*.zip
