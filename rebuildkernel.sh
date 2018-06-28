export DEVDIR=~/Desktop/TX2/jetpack-3.1/64_TX2/Linux_for_Tegra_tx2
export CROSS_COMPILE=/opt/jetpack3.0/install/bin/aarch64-unknown-linux-gnu-
export ARCH=arm64
export KERNEL_MODULES_OUT=$DEVDIR/images/modules
export TEGRA_KERNEL_OUT=$DEVDIR/images

mkdir -p $KERNEL_MODULES_OUT 
mkdir -p $TEGRA_KERNEL_OUT

cd $DEVDIR/sources/
make -C kernel/kernel-4.4/ O=$TEGRA_KERNEL_OUT tegra18_defconfig
# make -C kernel/kernel-4.4/ O=$TEGRA_KERNEL_OUT menuconfig
# make -C kernel/kernel-4.4/ O=$TEGRA_KERNEL_OUT xconfig
make -C kernel/kernel-4.4/ O=$TEGRA_KERNEL_OUT zImage
make -C kernel/kernel-4.4/ O=$TEGRA_KERNEL_OUT dtbs
make -C kernel/kernel-4.4/ O=$TEGRA_KERNEL_OUT modules
make -C kernel/kernel-4.4/ O=$TEGRA_KERNEL_OUT modules_install INSTALL_MOD_PATH=$KERNEL_MODULES_OUT

# define a variable with the name of the modules directory
export KERNEL_MODULES_NAME=4.4.38
cd $DEVDIR/images/modules/lib/modules/$KERNEL_MODULES_NAME
rm build source

# create tarball
cd $DEVDIR/images/modules/
tar -cjf kernel_supplements.tbz2 *
mv kernel_supplements.tbz2 $DEVDIR/images/packages

# generate your headers tarball 
cd $DEVDIR/kernel
tar -xf kernel_headers.tbz2

# Find the name of the headers file folder
ls | grep linux-headers
export KERNEL_HEADERS_NAME=linux-headers-4.4.38-tegra

# rename the folder:
cp -r $KERNEL_HEADERS_NAME linux-headers-$KERNEL_MODULES_NAME
tar -cjf kernel_headers_custom.tbz2 linux-headers-$KERNEL_MODULES_NAME
cp kernel_headers_custom.tbz2 $DEVDIR/images/packages
rm -rf linux-headers-$KERNEL_MODULES_NAME 

# Create a backup of the images and packages included in Jetpack

mkdir -p $DEVDIR/images/packages-backup
cp -rf $DEVDIR/kernel/* $DEVDIR/images/packages-backup

# copy dtb
cp $DEVDIR/images/arch/arm64/boot/dts/tegra186-quill-p3310-1000-c03-00-base.dtb $DEVDIR/kernel/dtb

#overwrite the default images with your own images to install and boot them using jetpack
cd $DEVDIR/images
cp -rf arch/arm64/boot/Image arch/arm64/boot/zImage packages/kernel_supplements.tbz2 $DEVDIR/kernel/
cp -rf packages/kernel_headers_custom.tbz2 $DEVDIR/kernel/kernel_headers.tbz2

# the applybinaries script to generate the image to flash

cd $DEVDIR/
sudo ./apply_binaries.sh

#cd $DEVDIR/bootloader/
#mv system.img.raw system.img $DEVDIR/images/packages-backup/

cd $DEVDIR/
sudo ./flash.sh -r -k kernel-dtb jetson-tx2 mmcblk1p1
sudo ./flash.sh jetson-tx2 mmcblk0p1

# sudo scp -r hainh@192.168.75.124:/home/hainh/Desktop/TX2/jetpack-3.1/64_TX2/Linux_for_Tegra_tx2/images/arch/arm64/boot/*Image /boot/
# sudo scp -r hainh@10.42.0.1:/home/hainh/Desktop/TX2/jetpack-3.1/images/arch/arm64/boot/dts/tegra* /boot/
# sudo scp -r hainh@10.42.0.1:/home/hainh/Desktop/TX2/jetpack-3.1/images/arch/arm64/boot/dts/tegra* /boot/dtb/
# sudo scp -r hainh@10.42.0.1:/home/hainh/Desktop/TX2/jetpack-3.1/modules/lib/modules/4.4.38 /lib/modules
#gst-launch-1.0 v4l2src ! video/x-raw,format=UYVY ! nvvidconv ! fakesink -v -e
#scp -r log_2018-06-27_16-06-00.txt hainh@192.168.75.230:~/Desktop/TX2/logs