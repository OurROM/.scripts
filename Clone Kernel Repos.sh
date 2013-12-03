#! /bin/bash
cd ~/aokp_kk
PATH=~/bin:$PATH

startSyncTime=$(date +%r)
cd ~/aokp_kk/kernel/lge/mako/
git clone https://github.com/faux123/mako.git ./
wait

git checkout origin/enhanced_stock
wait

cd ~/aokp_kk/kernel/asus/grouper/
git clone https://github.com/faux123/Nexus-grouper.git ./
wait

git checkout origin/enhanced_stock
wait
endSyncTime=$(date +%r)

echo " "
echo "Kernel Repos Synced"
echo "Sync Started: $startSyncTime"
echo "Sync Finished: $endSyncTime"

cd ~/aokp_kk
PATH=~/bin:$PATH
make clobber
wait
export USE_CCACHE=1
wait
export CCACHE_DIR=/home/thebytesmasher/.ccache
wait
prebuilts/misc/linux-x86/ccache/ccache -M 20G
wait
startBuildTime=$(date +%r)
. build/envsetup.sh && brunch grouper aokp_grouper-userdebug -j32
wait
endBuildTime=$(date +%r)

echo " "
echo "Build Time: $startBuildTime"
echo "Finished: $endBuildTime"

cd ~/aokp_kk/out/target/product/grouper/
file=$(echo aokp_grouper_unofficial*.zip)
cp $file ~/Dropbox/ROMs/N7

cd ~/aokp_kk
PATH=~/bin:$PATH
make clobber
wait

export USE_CCACHE=1
wait
export CCACHE_DIR=/home/thebytesmasher/.ccache
wait
prebuilts/misc/linux-x86/ccache/ccache -M 20G
wait
startBuildTime=$(date +%r)
. build/envsetup.sh && brunch mako aokp_mako-userdebug -j32
wait
endBuildTime=$(date +%r)

echo " "
echo "Build Time: $startBuildTime"
echo "Finished: $endBuildTime"

cd ~/aokp_kk/out/target/product/mako/
file=$(echo aokp_mako_unofficial*.zip)
cp $file ~/Dropbox/ROMs/N4/

