#! /bin/bash

cp ~/aokp_jb/scripts/common_versions.mk ~/aokp_jb/vendor/aokp/configs/common_versions.mk
cp ~/aokp_jb/scripts/common.mk ~/aokp_jb/vendor/aokp/configs/common.mk
cp ~/aokp_jb/scripts/core.mk ~/aokp_jb/build/target/product/core.mk

cd /home/thebytesmasher/Desktop/Latest_Builds/mako/
file=$(echo aokp_mako_Purely_Merged*.zip)
rm $file

cd ~/aokp_jb
PATH=~/bin:$PATH
make clobber

export USE_CCACHE=1
wait
export CCACHE_DIR=/home/thebytesmasher/.ccache
wait
prebuilts/misc/linux-x86/ccache/ccache -M 30G
wait
startBuildTimeM=$(date +%r)
. build/envsetup.sh && brunch mako aokp_mako-userdebug -j32
wait
endBuildTimeM=$(date +%r)

echo " "
echo "Build Time: $startBuildTimeM"
echo "Finished: $endBuildTimeM"

cd ~/aokp_jb/out/target/product/mako/
file=$(echo aokp_mako_Purely_Merged*.zip)
cp $file /home/thebytesmasher/Desktop/Latest_Builds/mako/

