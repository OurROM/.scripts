#! /bin/bash
cd ~/aokp_jb/
PATH=~/bin:$PATH
make clobber

# startSyncTime=$(date +%r)
cd ~/aokp_jb/kernel/lge/mako/
# git clone https://github.com/faux123/mako.git ./
# wait

git checkout aokp/enhanced_stock
wait

cd ~/aokp_jb/kernel/asus/grouper/
# git clone https://github.com/faux123/Nexus-grouper.git ./
# wait

git checkout aosp/android-tegra3-grouper-3.1-jb-mr1.1
wait
# endSyncTime=$(date +%r)

# echo " "
echo "Kernel Repos Synced"
# echo "Sync Started: $startSyncTime"
# echo "Sync Finished: $endSyncTime"

cd ~/aokp_jb/
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
file=$(echo aokp_mako_unofficial*.zip)
cp $file /home/thebytesmasher/Desktop/Latest_Builds/mako/

echo " "
echo " "

cd ~/aokp_jb/
PATH=~/bin:$PATH
make clobber
wait
export USE_CCACHE=1
wait
export CCACHE_DIR=/home/thebytesmasher/.ccache
wait
prebuilts/misc/linux-x86/ccache/ccache -M 30G
wait
startBuildTimeG=$(date +%r)
. build/envsetup.sh && brunch grouper aokp_grouper-userdebug -j32
wait
endBuildTimeG=$(date +%r)

echo " "
echo "Build Time: $startBuildTimeG"
echo "Finished: $endBuildTimeG"

cd ~/aokp_jb/out/target/product/grouper/
file=$(echo aokp_grouper_unofficial*.zip)
cp $file /home/thebytesmasher/Desktop/Latest_Builds/grouper/

echo " "
echo " "

wait

cd ~/aokp_jb/
PATH=~/bin:$PATH
make clobber
wait
export USE_CCACHE=1
wait
export CCACHE_DIR=/home/thebytesmasher/.ccache
wait
prebuilts/misc/linux-x86/ccache/ccache -M 30G
wait
startBuildTimeT=$(date +%r)
. build/envsetup.sh && brunch tilapia aokp_tilapia-userdebug -j32
wait
endBuildTimeT=$(date +%r)

echo " "
echo "Build Time: $startBuildTimeT"
echo "Finished: $endBuildTimeT"

cd ~/aokp_jb/out/target/product/tilapia/
file=$(echo aokp_tilapia_unofficial*.zip)
cp $file /home/thebytesmasher/Desktop/Latest_Builds/tilapia/

echo " "
echo " "


echo " "
echo "All Builds Completed"

echo " "
echo "Mako"
echo "Build Time: $startBuildTimeM"
echo "Finished: $endBuildTimeM"
echo " "
echo "Grouper"
echo "Build Time: $startBuildTimeG"
echo "Finished: $endBuildTimeG"
echo " "
echo "Tilapia"
echo "Build Time: $startBuildTimeT"
echo "Finished: $endBuildTimeT"

cd /home/thebytesmasher/aokp_jb/scripts/

ssh uploadGrouper.sh
wait
ssh uploadMako.sh
wait
ssh uploadTilapia.sh
wait

echo "All Files Uploading"


