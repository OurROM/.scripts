#! /bin/bash

cd ~/Desktop/Latest_Builds/manta/
file=$(echo UNOFFICIAL_aokp_manta_OurROM*.zip)
rm $file
rm $file.md5

cd ~/aokp_jb
# PATH=~/bin:$PATH
# make clobber

#export USE_CCACHE=1 && export CCACHE_DIR=/home/thebytesmasher/.ccache && prebuilts/misc/linux-x86/ccache/ccache -M 30G

startBuildTimeM=$(date +%r)
. build/envsetup.sh && time brunch manta aokp_manta-userdebug -j12
wait
endBuildTimeM=$(date +%r)

echo " "
echo "Build Time: $startBuildTimeM"
echo "Finished: $endBuildTimeM"

cd ~/aokp_jb/out/target/product/manta/
file=$(echo UNOFFICIAL_aokp_manta_OurROM*.zip)
cp $file /home/thebytesmasher/Desktop/Latest_Builds/manta/
wait

#Make MD5s
md5sum ~/Desktop/Latest_Builds/manta/UNOFFICIAL_aokp_manta_OurROM*.zip | cut -d' ' -f 1 | cat >> MAKOmd5s.txt
cd ~/Desktop/Latest_Builds/manta/
mmd5=$(echo UNOFFICIAL_aokp_manta_OurROM*.zip)
mv ~/aokp_jb/.scripts/MAKOmd5s.txt /home/thebytesmasher/Desktop/Latest_Buildsmanta/$mmd5.md5
echo " "
echo " "
