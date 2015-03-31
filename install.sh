#!/bin/sh

patchdir=`pwd`

echo -n "是否确认对PPP进行Patch并且安装Chap-proxy组件? (y/n)"
read ANS
case $ANS in
    y|Y|yes|Yes)

clear
echo -n "若当前文件夹下不存在OpenWrt源代码,将自动下载BB的源代码并Patch\n"
echo -n "请勾选Network----chap-proxy\n"
echo -n "任意键继续..."
read NULL

if [ ! -f "Makefile" ]; then
    git clone git://git.openwrt.org/14.07/openwrt.git
    cd openwrt
fi

./scripts/feeds update -a
./scripts/feeds install -a

cp -rf $patchdir/patchs/* ./

make menuconfig
;;

n|N|no|No)
    exit 0
;;
esac
