#! /bin/bash

cd /home/thebytesmasher/Desktop/Latest_Builds/tilapia/
file=$(echo aokp_tilapia_OurROM*.zip)
rm $file
rm $file.md5

cd ~/aokp_kk/
# PATH=~/bin:$PATH
# make clobber

#export USE_CCACHE=1 && export CCACHE_DIR=/home/thebytesmasher/.ccache && prebuilts/misc/linux-x86/ccache/ccache -M 30G

startBuildTimeT=$(date +%r)
. build/envsetup.sh && time brunch tilapia aokp_tilapia-userdebug -j12
wait
endBuildTimeT=$(date +%r)

echo " "
echo "Build Time: $startBuildTimeT"
echo "Finished: $endBuildTimeT"

cd ~/aokp_kk/out/target/product/tilapia/
file=$(echo aokp_tilapia_OurROM*.zip)
cp $file /home/thebytesmasher/Desktop/Latest_Builds/tilapia/

#Make MD5s
wait
md5sum ~/Desktop/Latest_Builds/tilapia/aokp_tilapia_OurROM*.zip | cut -d' ' -f 1 | cat >> TILAPIAmd5s.txt
cd /home/thebytesmasher/Desktop/Latest_Builds/tilapia/
tlmd5=$(echo aokp_tilapia_OurROM*.zip)
mv ~/aokp_kk/.scripts/TILAPIAmd5s.txt /home/thebytesmasher/Desktop/Latest_Builds/tilapia/$tlmd5.md5
echo " "
echo " "
