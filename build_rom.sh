#!/bin/bash

set -exv


# build rom
source build/envsetup.sh
lunch havoc_RMX1971-userdebug
brunch RMX1971


