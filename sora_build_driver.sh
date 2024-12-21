#!/bin/bash

# 1.在kernel的drv路径的Makefile添加一个config
# 2. copy drv文件到当前路径
# 3. 导出工具链, source lunch
#source ./build/envsetup.sh
#lunch rk3588m_vs-userdebug


ADDON_ARGS="CROSS_COMPILE=aarch64-linux-gnu-"
KERNEL_ARCH=arm64

KERNEL_PATH=$(cd $(dirname $0); pwd)
DRV_PATH=$KERNEL_PATH/drivers/media/i2c/
MODULE_CONFIG=CONFIG_VIDEO_OV5647

if [[ $1 = clean ]]; then
	make $ADDON_ARGS ARCH=$KERNEL_ARCH $MODULE_CONFIG=m -C $KERNEL_PATH M=$DRV_PATH clean
else
	make ARCH=$KERNEL_ARCH $ADDON_ARGS $MODULE_CONFIG=m -C  $KERNEL_PATH M=$DRV_PATH  modules
fi
