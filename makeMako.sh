#! /bin/bash

cd ~/Desktop/Latest_Builds/mako/
file=$(echo aokp_mako_OurROM*.zip)
rm $file
rm $file.md5

cd ~/aokp_kk

startBuildTimeM=$(date +%r)
. build/envsetup.sh && time brunch mako aokp_mako-userdebug -j20
wait
endBuildTimeM=$(date +%r)

echo " "
echo "Build Time: $startBuildTimeM"
echo "Finished: $endBuildTimeM"

cd ~/aokp_kk/out/target/product/mako/
file=$(echo aokp_mako_OurROM*.zip)
cp $file /home/thebytesmasher/Desktop/Latest_Builds/mako/
wait

#Make MD5s
md5sum ~/Desktop/Latest_Builds/mako/aokp_mako_OurROM*.zip | cut -d' ' -f 1 | cat >> MAKOmd5s.txt
cd ~/Desktop/Latest_Builds/mako/
mmd5=$(echo aokp_mako_OurROM*.zip)
mv ~/aokp_kk/.scripts/MAKOmd5s.txt /home/thebytesmasher/Desktop/Latest_Buildsmako/$mmd5.md5
echo " "
echo " "
