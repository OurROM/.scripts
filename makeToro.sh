#! /bin/bash

cd /home/thebytesmasher/Desktop/Latest_Builds/toro/
file=$(echo aokp_toro_OurROM*.zip)
rm $file
rm $file.md5

cd ~/aokp_jb/
# PATH=~/bin:$PATH
# make clobber

#export USE_CCACHE=1 && export CCACHE_DIR=/home/thebytesmasher/.ccache && prebuilts/misc/linux-x86/ccache/ccache -M 30G

startBuildTimeT=$(date +%r)
. build/envsetup.sh && time brunch toro aokp_toro-userdebug -j12
wait
endBuildTimeT=$(date +%r)

echo " "
echo "Build Time: $startBuildTimeT"
echo "Finished: $endBuildTimeT"

cd ~/aokp_jb/out/target/product/toro/
file=$(echo aokp_toro_OurROM*.zip)
cp $file /home/thebytesmasher/Desktop/Latest_Builds/toro/

#Make MD5s
wait
md5sum ~/Desktop/Latest_Builds/toro/aokp_toro_OurROM*.zip | cut -d' ' -f 1 | cat >> TOROmd5s.txt
cd /home/thebytesmasher/Desktop/Latest_Builds/toro/
tomd5=$(echo aokp_toro_OurROM*.zip)
mv ~/aokp_jb/.scripts/TOROmd5s.txt /home/thebytesmasher/Desktop/Latest_Builds/toro/$tomd5.md5
echo " "
echo " "
