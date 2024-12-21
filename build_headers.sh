#!/bin/sh
#make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- modules -j8
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- headers_install INSTALL_HDR_PATH=./kernel_build_header -j6
