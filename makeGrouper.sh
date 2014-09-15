#! /bin/bash

cd /home/thebytesmasher/Desktop/Latest_Builds/grouper/
file=$(echo aokp_grouper_OurROM*.zip)
rm $file
rm $file.md5

cd ~/aokp_kk

export USE_CCACHE=1
startBuildTimeG=$(date +%r)
. build/envsetup.sh && time brunch grouper aokp_grouper-userdebug -j12
wait
endBuildTimeG=$(date +%r)

echo " "
echo "Build Time: $startBuildTimeG"
echo "Finished: $endBuildTimeG"

cd ~/aokp_kk/out/target/product/grouper/
file=$"1.aokp_grouper_OurROM_"
cp *unofficial_*.zip /home/thebytesmasher/Desktop/Latest_Builds/grouper/${file}_$(date +"%m-%d-%y").zip


#Make MD5
wait
md5sum ~/Desktop/Latest_Builds/grouper/$file | cut -d' ' -f 1 | cat >> GROUPERmd5s.txt
cd ~/Desktop/Latest_Builds/grouper/
gmd5=$(echo aokp_grouper_OurROM*.zip)
mv ~/Desktop/Latest_Builds/grouper/ ~/Desktop/Latest_Builds/grouper/$gmd5.md5
echo " "
echo " "
