#!/bin/bash

set -exv


# build rom
. build/env*
lunch palladium_ysl-userdebug
make bacon
