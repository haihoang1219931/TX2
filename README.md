# TX2
This is how i do it
1. USB 3.0
   -Replace tegra186-quill-power-tree-p3310-1000-a00-00.dtsi in hardware/nvidia/platform/t18x/common/kernel-dts/t18x-common-platforms
   -Rebuild dtbs and copy to $DEVDIR/kernel/dtb (Read it in rebuildkernel.sh)
       cp $DEVDIR/images/arch/arm64/boot/dts/tegra186-quill-p3310-1000-c03-00-base.dtb $DEVDIR/kernel/dtb
   -Reflash dtbs in tx2 (Read it in rebuildkernel.sh)
       sudo ./flash.sh -r -k kernel-dtb jetson-tx2 mmcblk1p1    
2. TC358743 
   -Replace tc358743.c to kernel source
   -Rebuild kernel and reflash kernel in tx2 (Read it in rebuildkernel.sh)
       sudo ./flash.sh jetson-tx2 mmcblk0p1    
3. Test TC358743
   - run this command to see how it work
       gst-launch-1.0 v4l2src device=/dev/video0 ! nvvidconv ! "video/x-raw(memory:NVMM),format=UYVY,width=1920,height=1080,framerate=60/1" ! nvvidconv ! xvimagesink
