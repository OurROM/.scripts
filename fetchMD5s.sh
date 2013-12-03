#! /bin/bash
md5sum ~/Desktop/Latest_Builds/mako/aokp_mako_OurROM*.zip | cut -d' ' -f 1 | cat >> MAKOmd5s.txt
md5sum ~/Desktop/Latest_Builds/grouper/aokp_grouper_OurROM*.zip | cut -d' ' -f 1 | cat >> GROUPERmd5s.txt
md5sum ~/Desktop/Latest_Builds/tilapia/aokp_tilapia_OurROM*.zip | cut -d' ' -f 1 | cat >> TILAPIAmd5s.txt
md5sum ~/Desktop/Latest_Builds/toro/aokp_toro_OurROM*.zip | cut -d' ' -f 1 | cat >> TOROmd5s.txt
md5sum ~/Desktop/Latest_Builds/manta/aokp_manta_OurROM*.zip | cut -d' ' -f 1 | cat >> MANTAmd5s.txt

#mv ~/aokp_kk/.scripts/MAKOmd5s.txt ~/Desktop/Latest_Builds/mako/
#mv ~/aokp_kk/.scripts/GROUPERmd5s.txt ~/Desktop/Latest_Builds/grouper/
#mv ~/aokp_kk/.scripts/TILAPIAmd5s.txt ~/Desktop/Latest_Builds/tilapia/
#mv ~/aokp_kk/.scripts/TOROmd5s.txt ~/Desktop/Latest_Builds/toro/

cd ~/Desktop/Latest_Builds/mako/
mmd5=$(echo aokp_mako_OurROM*.zip)
mv ~/aokp_kk/.scripts/MAKOmd5s.txt ~/Desktop/Latest_Builds/mako/$mmd5.md5
wait
echo "Mako MD5 Complete"
echo " "

cd /home/thebytesmasher/Desktop/Latest_Builds/grouper/
gmd5=$(echo aokp_grouper_OurROM*.zip)
mv ~/aokp_kk/.scripts/GROUPERmd5s.txt ~/Desktop/Latest_Builds/grouper/$gmd5.md5
wait
echo "Grouper MD5 Complete"
echo " "

cd /home/thebytesmasher/Desktop/Latest_Builds/tilapia/
tlmd5=$(echo aokp_tilapia_OurROM*.zip)
mv ~/aokp_kk/.scripts/TILAPIAmd5s.txt ~/Desktop/Latest_Builds/tilapia/$tlmd5.md5
wait
echo "Tilapia MD5 Complete"
echo " "

cd /home/thebytesmasher/Desktop/Latest_Builds/toro/
tomd5=$(echo aokp_toro_OurROM*.zip)
mv ~/aokp_kk/.scripts/TOROmd5s.txt ~/Desktop/Latest_Builds/toro/$tomd5.md5
wait
echo "Toro MD5 Complete"
echo " "
cd ~/Desktop/Latest_Builds/manta/
mmd5=$(echo aokp_manta_OurROM*.zip)
mv ~/aokp_kk/.scripts/MANTAmd5s.txt ~/Desktop/Latest_Builds/manta/$mmd5.md5
wait
echo "Manta MD5 Complete"
echo " "
exit




